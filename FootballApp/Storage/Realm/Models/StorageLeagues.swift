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
    @objc dynamic var id: String = UUID.init().uuidString
    dynamic var storageCompetitions = List<StorageCompetition>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
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
