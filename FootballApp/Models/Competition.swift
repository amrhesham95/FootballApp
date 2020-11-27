//
//  Competition.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/22/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
// MARK: - Competition
struct Competition: Codable {
    let id: Int
    let area: Area
    let name: String
    let code: String?
    let emblemURL: String?
    let plan: Plan
    let currentSeason: CurrentSeason?
    let numberOfAvailableSeasons: Int?
//    let lastUpdated: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, area, name, code
        case emblemURL = "emblemUrl"
        case plan, currentSeason, numberOfAvailableSeasons
//        case lastUpdated
    }
}


extension Competition {
    var storageCompetition: StorageCompetition {
        let storageCompetition = StorageCompetition()
        storageCompetition.id = id
        storageCompetition.name = name
        storageCompetition.area = area.storageArea
        storageCompetition.currentSeason = currentSeason?.storageCurrentSeason
        return storageCompetition
    }
}
