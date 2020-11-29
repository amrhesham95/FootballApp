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
    private var rows: [Row]?
    
    // MARK: - Init
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
        loadRows()
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

// MARK: - ConfigureView
private extension TeamDetailsViewController {
    
    /// setup the table view's data source , delegate and register the cells needed
    func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
//        self.tableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "LeagueTableViewCell")
    }
    
    // Configure each cell with it's row
    func configureCell(_ cell:UITableViewCell, at indexPath :IndexPath){
//        cell.textLabel?.text = rows?[indexPath.row].title
        cell.textLabel?.text = rows?[indexPath.row].value
    }
}

// MARK: - DataSource Conformance
extension TeamDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        configureCell(cell, at: indexPath)
        return cell
    }
    
   
}


// MARK: - Build rows
private extension TeamDetailsViewController {
    
    func loadRows() {
        self.rows = [
            Row(title: "name", value: viewModel.team.name),
            Row(title: "area", value: viewModel.team.area?.name ?? ""),
            Row(title: "phone", value: viewModel.team.phone),
            Row(title: "address", value: viewModel.team.address),
            Row(title: "website", value: viewModel.team.website)
            
        ]
    }
}

// MARK: - Row
private struct Row {
    var title: String
    var value: String
}
