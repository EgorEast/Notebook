//
//  AppDelegate.swift
//  Notebook
//
//  Created by Egor Slobodskoy on 11.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainViewController = MainViewController()
        let eventsViewController = EventsViewController()
        let navController = UINavigationController()
        navController.setViewControllers([mainViewController, eventsViewController], animated: true)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        return true
    }
}

