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
    // make the list observable and subscribe on it in viewController
    var competitions = Observable<Array<Competition>>([])
    let network = Network()
    init() {
        network.getAllLeagues { [weak self] (leagues) in
            self?.competitions.value = leagues.competitions
        }
    }
    
}
