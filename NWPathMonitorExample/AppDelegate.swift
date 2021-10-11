//
//  AppDelegate.swift
//  NWPathMonitorExample
//
//  Created by Jonathan Hernandez on 11/10/21.
//

import UIKit
import Network

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let monitor = NWPathMonitor()
    let monitorQueue = DispatchQueue(label: "InternetConnectionMonitor")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                NotificationCenter.default.post(name: .connected, object: nil)
                print("Dispositivo conectado a internet")
            } else {
                NotificationCenter.default.post(name: .connectionLost, object: nil)
                print("Dispositivo sin conexión")
            }
        }
        
        monitor.start(queue: monitorQueue)
        
        return true
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension Notification.Name {
    static let connected = Notification.Name("connected")
    static let connectionLost = Notification.Name("connectionLost")
}

