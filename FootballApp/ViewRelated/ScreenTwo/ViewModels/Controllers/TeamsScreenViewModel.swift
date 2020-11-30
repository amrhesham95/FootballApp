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
    let store = Store()
    
    /// Return the team right away from the view model given the index of the wanted team
    subscript(index:Int) -> StorageTeam{
        return teams.value[index]
    }
    
    // MARK: - Init
    init(competitionID:Int) {
        self.competitionID = competitionID
        store.getAllTeams(with: self.competitionID) { (teamsResponse) in
            guard let teamsResponse = teamsResponse else { return }
            self.teams.value = Array(teamsResponse.storageTeams)
        }
    }
    
}

