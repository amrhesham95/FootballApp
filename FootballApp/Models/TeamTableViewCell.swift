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
    
    // MARK: - Properties
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamShortNameLabel: UILabel!
    @IBOutlet weak var teamLogoVIew: WKWebView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        loadImage()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadImage(){
        let url = URL(string: "https://crests.football-data.org/385.svg")
        
        if let svgURL = url {
            // register coder, on AppDelegate
            let SVGCoder = SDImageSVGCoder.shared
            SDImageCodersManager.shared.addCoder(SVGCoder)
            // load SVG url
            teamImageView.sd_setImage(with: svgURL)
            // Changing size
//            var rect = teamImageView.frame
//            rect.size.width = 200
//            rect.size.height = 200
//            teamImageView.frame = rect
            
        }

    }

    
    
}
