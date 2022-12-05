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
    private var listenerRegistrations: [ListenerRegistration] = []
    
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
    
    func register(withEmail email: String, password: String, completed: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { [self] authResult, error in
            if error == nil, let uid = authResult?.user.uid {
                try? database.collection("userInformations").document(uid).setData(from: UserInformation())
            }
            completed(error)
        }
    }
    
    func signIn(withEmail email: String, password: String, completed: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            completed(error)
        }
    }
    
    private func registerStateListener() {
        Auth.auth().addStateDidChangeListener { (auth, user) in // (4)
            print("Sign in state has changed.")
            self.hasCheckedUser = true
            self.user = user
            self.resetData()
            
            if let user = user {
                self.addListeners(withUserId: user.uid)
                let anonymous = user.isAnonymous ? "anonymously " : ""
                print("User signed in \(anonymous)with user ID \(user.uid).")
            }
            else {
                print("User signed out.")
            }
        }
    }
    
    private func resetData() {
        for listenerRegistration in listenerRegistrations {
            listenerRegistration.remove()
        }
        listenerRegistrations = []
        flights = []
    }
    
    private func addListeners(withUserId userId: String ) {
        listenerRegistrations.append(addFlightsListener(withUserId: userId))
        // Add planes listener
    }
    
    func readUserInformation(completed: @escaping (UserInformation?) -> Void) {
        if let user = user {
            database
                .collection("userInformations")
                .document(user.uid)
                .getDocument { (document, error) in
                    if let document = document, document.exists {
                        completed(try? document.data(as: UserInformation.self))
                    }
                }
        }
    }
    
    private func addFlightsListener(withUserId userId: String) -> ListenerRegistration {
        database
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
    
    func saveUserInformation(userInformation: UserInformation) throws {
        if let user = user {
            do {
                let _ = try database.collection("userInformations").document(user.uid).setData(from: userInformation)
            } catch {
                throw error
            }
        } else {
            throw FError.userNotSignedIn
        }
    }
    
}
