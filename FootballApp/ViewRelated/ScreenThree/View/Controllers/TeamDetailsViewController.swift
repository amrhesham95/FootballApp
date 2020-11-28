//
//  TeamDetailsVIewControllerViewController.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/28/20.
//  Copyright © 2020 jets. All rights reserved.
//

import UIKit

// MARK: - TeamDetailsViewController
class TeamDetailsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel:TeamDetailsViewModel
    
    init(viewModel:TeamDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

}

// MARK: - TableView Delegate
 extension TeamDetailsViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        if let url = URL(string: self.viewModel.team.crestURL) {
            imageView.sd_setImage(with: url, completed: nil)
        }
        return imageView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        self.view.frame.height / 3
    }
    
}

// MARK: - ConfigureVIew
private extension TeamDetailsViewController {
    
    func configureTableView() {
//        self.tableView.dataSource = self
        self.tableView.delegate = self
//        self.tableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "LeagueTableViewCell")
    }
    
    func configureCell(_ cell:UITableViewCell, at indexPath :IndexPath){
//        let cellViewModel = LeagueTableViewCellViewModel(competition: viewModel.competitions.value[indexPath.row])
//        cell.viewModel = cellViewModel
    }
}
