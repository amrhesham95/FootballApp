//
//  Team.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/23/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
// MARK: - Team
struct Team: Codable {
    let id: Int
    let area: Area
    let name, shortName, tla: String
    let crestURL: String?
    let address, phone: String?
    let website: String?
    let email: String?
    let founded: Int?
    let clubColors: String?
    let venue: String?
//    let lastUpdated: Date

    enum CodingKeys: String, CodingKey {
        case id, area, name, shortName, tla
        case crestURL = "crestUrl"
        case address, phone, website, email, founded, clubColors, venue
//        case lastUpdated
    }
}


extension Team {
    var storageTeam: StorageTeam {
        let storageTeam = StorageTeam()
        storageTeam.id = id
        storageTeam.area = area.storageArea
        storageTeam.name = name
        storageTeam.crestURL = crestURL ?? ""
        storageTeam.shortName = shortName
        storageTeam.address = address ?? ""
        storageTeam.phone = phone ?? ""
        storageTeam.website = website ?? ""
        
        return storageTeam
    }
}
