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
    var competition:Competition
    
    // MARK: - Init
    init(competition:Competition) {
        self.competition = competition
    }
}
