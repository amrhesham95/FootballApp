//
//  CurrentSeason.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/22/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
// MARK: - CurrentSeason
struct CurrentSeason: Codable {
    let id: Int
    let startDate, endDate: String
    let currentMatchday: Int?
    let winner: Winner?
}

extension CurrentSeason {
    var storageCurrentSeason: StorageCurrentSeason {
        let currentSeason = StorageCurrentSeason()
        currentSeason.id = id
        currentSeason.startDate = startDate
        currentSeason.endDate = endDate
        return currentSeason
    }
}
