//
//  StorageTeams.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/27/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - StorageTeams
class StorageTeamsResponse: Object {
    @objc dynamic var count: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var storageCompetition: StorageCompetition?
    dynamic var storageTeams =  List<StorageTeam>()
    
}
//// MARK: - Teams
//struct Teams: Codable {
//    let count: Int?
//    let filters: Filters?
//    let competition: Competition?
//    let season: Season?
//    let teams: [Team]?
//}
