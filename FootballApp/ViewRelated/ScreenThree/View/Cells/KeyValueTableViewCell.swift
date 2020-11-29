//
//  KeyValueTableViewCell.swift
//  ConfirmScreenDemo
//
//  Created by Amr Hesham on 10/27/20.
//  Copyright © 2020 VictoryLink. All rights reserved.
//

import Foundation
import UIKit

// MARK: - KeyValueTableViewCell
//
class KeyValueTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Properties
    
    var formData: FormCellRepresentable? {
        didSet {
            setupView()
        }
    }
    
    // MARK: - SetupView
    
    private func setupView() {
        titleLabel.text = formData?.placeholder
        valueLabel.text = formData?.value
    }
}

// MARK: - Public Handlers
//
extension KeyValueTableViewCell {
    
    // i made it to handle history details key : value
    
    func configureCell(key: String?, value: String?) {
        titleLabel.text = "\(key ?? ""): "
        valueLabel.text = value
    }
}
