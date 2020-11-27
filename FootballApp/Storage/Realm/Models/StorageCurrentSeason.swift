//
//  StorageCurrentSeason.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/27/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - StorageCurrentSeason
class StorageCurrentSeason: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var area: Int = 0
    @objc dynamic var startDate: String = ""
    @objc dynamic var endDate: String = ""
}

//
//// MARK: - CurrentSeason
//struct CurrentSeason: Codable {
//    let id: Int
//    let startDate, endDate: String
//    let currentMatchday: Int?
//    let winner: Winner?
//}
