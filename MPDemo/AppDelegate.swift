//
//  AppDelegate.swift
//  MPDemo
//
//  Created by Ray Berry on 25/08/2023.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Set up URL caching for Async Loads
        let urlCache = URLCache(memoryCapacity: 10_000_000, diskCapacity: 1_000_000_000, diskPath: nil)
        URLCache.shared = urlCache
        
        return true
    }
}
