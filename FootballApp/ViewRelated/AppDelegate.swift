//
//  AppDelegate.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/15/20.
//  Copyright © 2020 jets. All rights reserved.
//

import UIKit
import SDWebImageSVGCoder

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // register coder, on AppDelegate
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        
        let leaguesScreenViewController = LeaguesScreenViewController(viewModel: LeaguesScreenViewModel())
        let navigationController = UINavigationController(rootViewController: leaguesScreenViewController)
        self.window?.rootViewController = navigationController
        return true
    }



}

