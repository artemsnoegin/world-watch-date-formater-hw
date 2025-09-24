//
//  AppDelegate.swift
//  DateHW
//
//  Created by Артём Сноегин on 24.09.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = WorldClockTableVC()
        window?.makeKeyAndVisible()
        
        return true
    }

}

