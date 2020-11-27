//
//  StorageCompetition.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/27/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - StorageCompetition
class StorageCompetition: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var area: StorageArea?
    @objc dynamic var name: String = ""
    @objc dynamic var currentSeason: StorageCurrentSeason?
}


//// MARK: - Competition
//struct Competition: Codable {
//    let id: Int
//    let area: Area
//    let name: String
//    let code: String?
//    let emblemURL: String?
//    let plan: Plan
//    let currentSeason: CurrentSeason?
//    let numberOfAvailableSeasons: Int?
////    let lastUpdated: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case id, area, name, code
//        case emblemURL = "emblemUrl"
//        case plan, currentSeason, numberOfAvailableSeasons
////        case lastUpdated
//    }
//}
