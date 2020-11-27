//
//  StorageTeam.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/27/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - StorageTeam
class StorageTeam: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var area: StorageArea?
    @objc dynamic var name: String = ""
    @objc dynamic var shortName: String = ""
    @objc dynamic var crestURL: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var website: String = ""
//    @objc dynamic var filters: StorageFilter = 0
    @objc dynamic var storageCompetition: StorageCompetition?
    
}


//// MARK: - Team
//struct Team: Codable {
//    let id: Int
//    let area: Area
//    let name, shortName, tla: String
//    let crestURL: String?
//    let address, phone: String?
//    let website: String?
//    let email: String?
//    let founded: Int?
//    let clubColors: String?
//    let venue: String?
////    let lastUpdated: Date
//
//    enum CodingKeys: String, CodingKey {
//        case id, area, name, shortName, tla
//        case crestURL = "crestUrl"
//        case address, phone, website, email, founded, clubColors, venue
////        case lastUpdated
//    }
//}
