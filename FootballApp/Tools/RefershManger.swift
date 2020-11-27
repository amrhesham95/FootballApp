//
//  RefershManger.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/27/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

// MARK: - Refresh Handler - CHeck if it possible to refresh using definite key and interval types
//
class RefreshHandler: NSObject {
    
    // MARK: - Properties
    
    private let calender = Calendar.current
    
    private let defaults: UserDefaults = .standard
    
    private let key: Key
    
    private let interval: Interval
    
    // MARK: - Init
    
    init(key: Key, interval: Interval) {
        self.key = key
        self.interval = interval
    }
    
    // MARK: - Should Refresh
    
    var shouldRefresh: Bool {
        return shouldRefreshWithUpdateLastRefreshDate()
    }
}

// MARK: - Private Handlers
//
private extension RefreshHandler {
    
    /// Return boolean if refresh data required or not, it means number of hours exceed `interval.value`
    func shouldRefreshWithUpdateLastRefreshDate() -> Bool {
        
        guard let date = defaults.object(forKey: key.rawValue) as? Date,
              dateDifference(from: date) <= interval.value else {
            /// Persist value for last refesh date (Current time)
            defaults.set(Date(), forKey: key.rawValue)
            return true
        }
        
        return false
    }
    
    /// Get diffrence between last date in userdefaults and current date
    func dateDifference(from fromDate: Date, to toDate: Date = Date()) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([interval.component], from: fromDate, to: toDate)
        return components.value(for: interval.component) ?? .zero
    }
}

extension RefreshHandler {
    
    struct Interval {
        let value: Int
        let component: Calendar.Component
    }
    
    enum Key: String {
        case notifications = "notifications_last_refresh"
        case services = "services_last_refresh"
    }
}
