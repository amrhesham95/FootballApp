//
//  StorageArea.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/27/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - StorageTeam
class StorageArea: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    
}


//// MARK: - Area
//struct Area: Codable {
//    let id: Int
//    let name, countryCode: String?
//    let ensignURL: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, countryCode
//        case ensignURL = "ensignUrl"
//    }
//}
