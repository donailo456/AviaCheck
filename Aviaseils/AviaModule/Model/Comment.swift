//
//  Comment.swift
//  Aviaseils
//
//  Created by Danil Komarov on 25.07.2023.
//

import Foundation

struct Welcome: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let origin: String
    let destination: String
    let origin_airport: String
    let destination_airport: String
    let price: Int
    let airline: String
    let flight_number: String
    let departure_at: String
    let return_at: String?
    let transfers, return_transfers, duration_to: Int
    let duration_back: Int
    let link: String
}
