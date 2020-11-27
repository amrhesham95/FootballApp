//
//  LeagueTableViewCellViewModel.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/27/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

// MARK: - LeagueTableViewCellViewModel
class LeagueTableViewCellViewModel {
    
    
    // MARK: - Properties
    var competition:StorageCompetition
    
    // MARK: - Init
    init(competition:StorageCompetition) {
        self.competition = competition
    }
}
