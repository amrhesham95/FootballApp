//
//  TeamsResponse.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/23/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

// MARK: - Teams
struct TeamsResponse: Codable {
    let count: Int?
    let filters: Filters?
    let competition: Competition?
    let season: Season?
    let teams: [Team]?
}

extension TeamsResponse {
    var storageTeamsResponse: StorageTeamsResponse {
        let storageTeamsResponse = StorageTeamsResponse()
        storageTeamsResponse.count = count ?? .zero
        teams?.forEach({ (team) in
            storageTeamsResponse.storageTeams.append(team.storageTeam)
        })

        return storageTeamsResponse
    }
}
