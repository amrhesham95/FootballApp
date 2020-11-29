//
//  UITableview+Helpers.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/30/20.
//  Copyright © 2020 jets. All rights reserved.
//

import UIKit

// MARK: - UITableView + Helpers
//
extension UITableView {
    
    func registerCellNib<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        let nibName = reuseIdentifier ?? T.classNameWithoutNamespaces
        self.register(T.loadNib(), forCellReuseIdentifier: nibName)
        //self.register(T.self, forCellReuseIdentifier: )
    }
    
    /// Dequeue cell with generics
    func dequeue<T: UITableViewCell>(_: T.Type) -> T {
        guard
            let cell = dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T
        else { fatalError("Could not deque cell with type \(T.self)") }
        
        return cell
    }
    
    /// Register UITableViewHeaderFooterView using a nib.
    func registerHeaderNib<T: UITableViewHeaderFooterView>(_: T.Type) {
        register(T.loadNib(), forHeaderFooterViewReuseIdentifier: T.classNameWithoutNamespaces)
    }
    
    /// Dequee reusable `HeaderFooterView` with type.
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: T.classNameWithoutNamespaces) as? T else {
            fatalError("Unable to get header view")
        }
        return header
    }
    
    
}
