//
//  StorageCompetitions.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/27/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - StorageCompetitions
class StorageLeagues: Object {
    @objc dynamic var count: Int = 0
//    @objc dynamic var filters: StorageFilter = 0
    dynamic var storageCompetitions = List<StorageCompetition>()
    
}
//// MARK: - Competitions
//struct Competitions: Codable {
//    let count: Int
//    let filters: Filters
//    let competitions: [Competition]?
//}
//
//
//// MARK: - Filters
//struct Filters: Codable {
//}
