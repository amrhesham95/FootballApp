//
//  AppDelegate.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/15/20.
//  Copyright © 2020 jets. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let leaguesScreenViewController = LeaguesScreenViewController(viewModel: LeaguesScreenViewModel())
        self.window?.rootViewController = leaguesScreenViewController
        return true
    }



}

