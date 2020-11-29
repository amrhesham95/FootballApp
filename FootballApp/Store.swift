//
//  Store.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/28/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

// MARK: - Store
class Store {
    // MARK: - Properties
    let network = Network()
    let leaguesRefreshHandler = RefreshHandler(key: .leagues, interval: Constants.leaguesRefreshInterval)
    let teamsRefreshHandler = RefreshHandler(key: .teams, interval: Constants.teamsRefreshInterval)
    let storageManager = RealmStorage()
    
}

// MARK: Leagues Handlers
extension Store {
    
    func getAllLeagues(completion:@escaping (StorageLeagues?) -> Void){
        
        let isNetworkAvailable = Reachability.isConnectedToNetwork()
        isNetworkAvailable ? updateLeaguesThenFetch(completion: completion) : fetchLeagues(completion: completion)
        
    }
    
    func updateLeaguesThenFetch(completion: @escaping (StorageLeagues?) -> Void) {
        self.network.getAllLeagues { [weak self] (storageLeagues) in
            DispatchQueue.main.async {
                try? self?.storageManager.insertNewObject(object: storageLeagues)
                completion(storageLeagues)
            }
            
        }
    }
    
    func fetchLeagues(completion: @escaping (StorageLeagues?) -> Void) {
        let leagues = storageManager.allObjects(ofType: StorageLeagues.self).first
        completion(leagues)
        
    }
}


// MARK: - Teams Handlers
extension Store {
    //TODO: Refactor
    func getAllTeams(with id:Int, completion:@escaping (StorageTeamsResponse) -> Void){
        let query = "id == \(id)"
        let predicate = NSPredicate(format: query)
        if storageManager.allObjects(ofType: StorageTeamsResponse.self, matching: predicate).count != 0 {
            if teamsRefreshHandler.shouldRefresh {
                //TODO: delete the old and insert .. or update
                self.network.getAllTeams(with:id) { [weak self] (storageTeams) in
                    DispatchQueue.main.async {
                        do {
                            storageTeams.id = id
                            try self?.storageManager.insertNewObject(object: storageTeams)
                            if let teams = self?.fetchTeams(with: id) {
                                completion(teams)
                            }
                            
                        }catch {
                            print(error)
                        }
                    }
                    
                }
            }else {
                if let teams = fetchTeams(with:id) {
                    completion(teams)
                }
            }
        }else {
            self.network.getAllTeams(with:id) { [weak self] (storageTeams) in
                DispatchQueue.main.async {
                    do {
                        storageTeams.id = id
                        try self?.storageManager.insertNewObject(object: storageTeams)
                        if let teams = self?.fetchTeams(with: id) {
                            completion(teams)
                        }
                        
                    }catch {
                        print(error)
                    }
                }
                
            }
        }
        
        
        
    }
    
    func fetchTeams(with id:Int) -> StorageTeamsResponse? {
        let query = "id == \(id)"
        let predicate = NSPredicate(format: query)
        return storageManager.allObjects(ofType: StorageTeamsResponse.self, matching: predicate).first
        
    }
}

// MARK: - Constants
//
private extension  Store {
    
    enum Constants {
        
        /// Refresh interval to fetch new values `12 month `.
        static let leaguesRefreshInterval = RefreshHandler.Interval(value: 12, component: .month)
        
        /// Refresh interval to fetch new values `1 month `.
        static let teamsRefreshInterval = RefreshHandler.Interval(value: 1, component: .month)
    }
}
