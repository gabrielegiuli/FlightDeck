//
//  FirebaseManager.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class FirebaseManager: ObservableObject {
    
    static let shared = FirebaseManager()
    private var database = Firestore.firestore()
    private var listenerRegistration: ListenerRegistration?
    
    @Published var flights: [Flight] = []
    @Published var user: User?
    @Published var hasCheckedUser = false
    
    var isLoggedIn: Bool {
        user != nil
    }
    
    private init() {
        registerStateListener()
    }
    
    func signOut() throws {
        do {
            try Auth.auth().signOut()
        } catch {
            throw error
        }
    }
    
    func signIn(withEmail email: String, password: String, completed: @escaping (Error?) -> Void ) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            completed(error)
        }
    }
    
    private func registerStateListener() {
        Auth.auth().addStateDidChangeListener { (auth, user) in // (4)
            print("Sign in state has changed.")
            self.hasCheckedUser = true
            self.user = user
            
            if let user = user {
                self.addFlightsListener(withUserId: user.uid)
                let anonymous = user.isAnonymous ? "anonymously " : ""
                print("User signed in \(anonymous)with user ID \(user.uid).")
            }
            else {
                print("User signed out.")
            }
        }
    }
    
    func addFlightsListener(withUserId userId: String) {
        self.listenerRegistration?.remove()
        self.listenerRegistration = database
            .collection("flights")
            .whereField("userId", isEqualTo: userId)
            .order(by: "createdTime", descending: true)
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    self.flights = querySnapshot.documents.compactMap { document -> Flight? in
                        try? document.data(as: Flight.self)
                    }
                }
            }
    }
    
    func addNewFlight(flight: Flight) throws {
        if let user = user {
            do {
                var newFlight = flight
                newFlight.userId = user.uid
                let _ = try database.collection("flights").addDocument(from: newFlight)
            } catch {
                throw error
            }
        } else {
            throw FError.userNotSignedIn
        }
    }
    
}
