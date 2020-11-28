//
//  TeamDetailsViewModel.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/28/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

// MARK: - TeamDetailsViewModel
class TeamDetailsViewModel {
    
    // MARK: - Properties
    var team:StorageTeam
    
    // MARK: - Init
    init(team:StorageTeam) {
        self.team = team
    }
    
}
