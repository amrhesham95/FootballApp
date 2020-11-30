//
//  LeaguesScreenViewModel.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/22/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

// MARK: - LeaguesScreenViewModel
class LeaguesScreenViewModel {
    
    // MARK: - Properties
    var competitions = Observable<Array<StorageCompetition>>([])
    let store: Store
    
    /// Return the comptetion right away from the view model given the index of the wanted comptetion
    subscript(index:Int) -> StorageCompetition{
        return competitions.value[index]
    }
    
    // MARK: - Init
    // init with store to make it easy in case of unit test in the future
    init(store: Store = Store()) {
        self.store = store
        getAllLeagues()
    }
    
    // MARK: - Handlers
    func getAllLeagues() {
        store.getAllLeagues { [weak self] (leagues) in
            guard let leagues = leagues else { return }
            self?.competitions.value = Array(leagues.storageCompetitions)
        }
    }
    
}
