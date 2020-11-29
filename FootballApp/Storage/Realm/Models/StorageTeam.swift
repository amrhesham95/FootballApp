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
    @objc dynamic var storageCompetition: StorageCompetition?
    
}
