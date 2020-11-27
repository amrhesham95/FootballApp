//
//  TeamsScreenViewModel.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/23/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

// MARK: - TeamsScreenViewModel
class TeamsScreenViewModel {
    
    // MARK: - Properties
    var teams = Observable<Array<StorageTeam>>([])
    var competitionID:Int
    let network = Network()
    
    // MARK: - Init
    init(competitionID:Int) {
        self.competitionID = competitionID
        network.getAllTeams(with: self.competitionID) { (team) in
            self.teams.value = team
        }
    }
    
}

