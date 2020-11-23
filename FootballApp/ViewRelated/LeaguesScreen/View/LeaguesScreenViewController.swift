//
//  LeaguesScreenViewController.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/22/20.
//  Copyright © 2020 jets. All rights reserved.
//

import UIKit

// MARK: - LeaguesScreenViewController
class LeaguesScreenViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    var viewModel: LeaguesScreenViewModel! 
    
    // MARK: - Init
    init(viewModel:LeaguesScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "LeaguesScreenViewController", bundle: nil)
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

extension LeaguesScreenViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.competitions.value[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.competitions.value.count
    }
}

// MARK: - Binding
private extension LeaguesScreenViewController {
    
    func bindOnViewModel() {
        self.viewModel.competitions.addObserver(fireNow: false) { (comptetions) in
            self.tableView.reloadData()
        }
    }
}

// MARK: - ConfigureVIew
private extension LeaguesScreenViewController {
    
    func configureTableView() {
        self.tableView.dataSource = self
    }
}
