//
//  TeamsScreenViewController.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/23/20.
//  Copyright © 2020 jets. All rights reserved.
//

import UIKit

// MARK: - TeamsScreenViewController
//
class TeamsScreenViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: TeamsScreenViewModel!
    
    // MARK: - Init
    init(viewModel:TeamsScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindOnViewModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    
}

// MARK: - TableViewDataSource conformance
extension TeamsScreenViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(TeamTableViewCell.self)
        configureCell(cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.teams.value.count
    }
}

// MARK: - TableView Delegate Methods
extension TeamsScreenViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamDetailsViewController = TeamDetailsViewController(viewModel:TeamDetailsViewModel(team: self.viewModel.teams.value[indexPath.row]))
        self.navigationController?.pushViewController(teamDetailsViewController, animated: true)

    }
}

// MARK: - Binding
private extension TeamsScreenViewController {
    
    func bindOnViewModel() {
        self.viewModel.teams.addObserver(fireNow: false) { (comptetions) in
            self.tableView.reloadData()
        }
    }
}

// MARK: - ConfigureVIew
private extension TeamsScreenViewController {
    
    func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerCellNib(TeamTableViewCell.self)
    }
    
    func configureCell(_ cell:TeamTableViewCell, at indexPath :IndexPath){
        let cellViewModel = TeamTableViewCellViewModel(team: viewModel[indexPath.row])
        cell.viewModel = cellViewModel
    }
}
