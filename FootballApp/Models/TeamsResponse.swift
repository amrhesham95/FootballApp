//
//  TeamsResponse.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/23/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
// MARK: - TeamsResponse
struct TeamsResponse: Codable {
    let count: Int?
    let filters: Filters?
    let competition: Competition?
    let season: Season?
    let teams: [Team]?
}
