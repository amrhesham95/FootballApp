//
//  LeagueTableViewCell.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/27/20.
//  Copyright © 2020 jets. All rights reserved.
//

import UIKit

// MARK: - LeagueTableViewCell
class LeagueTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var leageNameLabel: UILabel!
    @IBOutlet weak var leagueAreaLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    // MARK: - Properties
    var viewModel:LeagueTableViewCellViewModel? {
        didSet {
            configureCell()
        }
    }
    
}

// MARK: - ConfigureVIew
private extension LeagueTableViewCell {
    
    func configureCell() {
        self.leageNameLabel.text = viewModel?.competition.name
        self.leagueAreaLabel.text = viewModel?.competition.area.name
        self.startDateLabel.text = viewModel?.competition.currentSeason?.startDate
        self.endDateLabel.text = viewModel?.competition.currentSeason?.endDate
        
    }
}
