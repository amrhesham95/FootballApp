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

    

}

// MARK: - ConfigureView
private extension TeamDetailsViewController {
    
    /// setup the table view's data source , delegate and register the cells needed
    func configureTableView() {
        self.tableView.registerCellNib(KeyValueTableViewCell.self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        loadImageIntoTableHeader(tableView: self.tableView)
    }
    
    // Configure each cell with it's row
    func configureCell(_ cell:KeyValueTableViewCell, at indexPath :IndexPath){
        cell.formData = rows?[indexPath.row]
    }
    
    func loadImageIntoTableHeader(tableView:UITableView) {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        if let url = URL(string: self.viewModel.team.crestURL) {
            imageView.sd_setImage(with: url, completed: nil)
        }
        let imageViewHeight = tableView.frame.size.height / 4
        let imageViewWidth = tableView.frame.size.width
        imageView.frame = CGRect(origin: tableView.frame.origin, size: CGSize(width: imageViewWidth, height: imageViewHeight))
        tableView.tableHeaderView = imageView
        tableView.reloadData()
        
    }
}

// MARK: - DataSource Conformance
extension TeamDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(KeyValueTableViewCell.self)
        configureCell(cell, at: indexPath)
        return cell
    }
    
   
}


// MARK: - Build rows
private extension TeamDetailsViewController {
    
    func loadRows() {
        self.rows = [
            Row(placeholder: "name", value: viewModel.team.name),
            Row(placeholder: "area", value: viewModel.team.area?.name ?? ""),
            Row(placeholder: "phone", value: viewModel.team.phone),
            Row(placeholder: "address", value: viewModel.team.address),
            Row(placeholder: "website", value: viewModel.team.website)
            
        ]
    }
}

// MARK: - Row
private struct Row:FormCellRepresentable {
    var placeholder: String?
    
    var value: String?

}
