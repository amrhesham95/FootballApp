//
//  Season.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/23/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
// MARK: - Season
struct Season: Codable {
    let id: Int
    let startDate, endDate: String
    let currentMatchday: JSONNull?
    let availableStages: [String]
}
