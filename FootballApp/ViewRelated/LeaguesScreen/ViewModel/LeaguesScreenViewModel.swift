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
    var list = [2000,2001,2002,2003,2013,2014,2015,2016,2017,2018,2019,2021]
    // make the list observable and subscribe on it in viewController
    var competitions = Observable<Array<Competition>>([])
    let network = Network()
    init() {
        network.getAllLeagues { [weak self] (leagues) in
            self?.competitions.value = leagues.competitions?.filter({ [weak self] (competition) -> Bool in
                self?.list.contains(competition.id) ?? false
            }) ?? []
        }
    }
    
}
