//
//  Leagues.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/22/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Leagues: Codable {
    let count: Int
    let filters: Filters
    let competitions: [Competition]?
}


// MARK: - Filters
struct Filters: Codable {
}
