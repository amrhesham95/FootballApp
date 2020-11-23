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
    // make the list observable and subscribe on it in viewController
    var teams = Observable<Array<Team>>([])
    var competitionID:Int {
        didSet {
            network.getAllTeams(with: self.competitionID) { (team) in
                self.teams.value = team
            }
        }
    }
    let network = Network()
    init(competitionID:Int) {
        self.competitionID = competitionID
        network.getAllTeams(with: self.competitionID) { (team) in
            self.teams.value = team
        }
    }
    
}
