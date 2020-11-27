//
//  TeamTableViewCell.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/27/20.
//  Copyright © 2020 jets. All rights reserved.
//

import UIKit
import WebKit
import SDWebImageSVGCoder
// MARK: - TeamTableViewCell
class TeamTableViewCell: UITableViewCell, WKNavigationDelegate {
    
    
    // MARK: - Outlets
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamShortNameLabel: UILabel!
    @IBOutlet weak var teamLogoVIew: WKWebView!
    
    // MARK: - Properties
    var viewModel:TeamTableViewCellViewModel? {
        didSet {
            configureCell()
        }
    }
        
}

// MARK: - ConfigureVIew
private extension TeamTableViewCell {
    
    func configureCell() {
        self.teamNameLabel.text = viewModel?.team.name
        self.teamShortNameLabel.text = viewModel?.team.shortName
        let url = URL(string: self.viewModel?.team.crestURL ?? "" )
        if let svgURL = url {
            // load SVG url
            self.teamImageView.sd_setImage(with: svgURL)
        }
    }
}
