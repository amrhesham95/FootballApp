//
//  Area.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/22/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

// MARK: - Area
struct Area: Codable {
    let id: Int
    let name, countryCode: String
    let ensignURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, countryCode
        case ensignURL = "ensignUrl"
    }
}
