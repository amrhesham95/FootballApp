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
    let filters =  [2000,2001,2002,2003,2013,2014,2015,2016,2017,2018,2019,2021]
    let competitions: [Competition]?
}


// MARK: - Filters
struct Filters: Codable {
}


extension Leagues {
   
    var storageLeagues: StorageLeagues {
        let storageLeagues = StorageLeagues()
        storageLeagues.count = count
        competitions?.forEach({(comptetion) in
            if self.filters.contains(comptetion.id){
                storageLeagues.storageCompetitions.append(comptetion.storageCompetition)
            }
        })
        return storageLeagues
    }
}
