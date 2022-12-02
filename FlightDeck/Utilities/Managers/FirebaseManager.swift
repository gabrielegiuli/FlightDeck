//
//  FirebaseManager.swift
//  FlightDeck
//
//  Created by Gabriele Giuli on 02/12/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class FirebaseManager: ObservableObject {
    
    static let shared = FirebaseManager()
    private var database = Firestore.firestore()
    
    @Published var flights: [Flight] = []
    
    private init() {
        addFlightsListener()
    }
    
    func addFlightsListener() {
        database.collection("flights").order(by: "createdTime").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.flights = querySnapshot.documents.compactMap { document -> Flight? in
                    try? document.data(as: Flight.self)
                }
            }
        }
    }
    
    func addNewFlight(flight: Flight) {
        do {
            let _ = try database.collection("flights").addDocument(from: flight)
        }
        catch {
            print("There was an error while trying to save a task \(error.localizedDescription).")
        }
    }
    
}
