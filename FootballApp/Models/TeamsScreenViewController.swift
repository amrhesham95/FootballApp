//
//  TeamsScreenViewController.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/23/20.
//  Copyright © 2020 jets. All rights reserved.
//

import UIKit

// MARK: - TeamsScreenViewController
class TeamsScreenViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: TeamsScreenViewModel!
    
    // MARK: - Init
    init(viewModel:TeamsScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "TeamsScreenViewController", bundle: nil)
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

extension TeamsScreenViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = viewModel.teams.value[indexPath.row].name
        cell.detailTextLabel?.text = viewModel.teams.value[indexPath.row].area.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.teams.value.count
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
    }
}
