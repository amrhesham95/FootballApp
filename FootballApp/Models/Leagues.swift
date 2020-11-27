//
//  Leagues.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/22/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

// MARK: - Competitions
struct Leagues: Codable {
    let count: Int
    let filters: Filters
    let competitions: [Competition]?
}


// MARK: - Filters
struct Filters: Codable {
}


extension Leagues {
    var storageLeagues: StorageLeagues {
        let storageLeagues = StorageLeagues()
        storageLeagues.count = count
        competitions?.forEach({ (comptetion) in
            storageLeagues.storageCompetitions.append(comptetion.storageCompetition)
        })
        return storageLeagues
    }
}
