//
//  WalletlyApp.swift
//  Walletly
//
//  Created by Gokhan Kaya on 20.09.2023.
//

import SwiftUI
import Firebase

@main
struct WalletlyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? =
        nil) -> Bool {
            FirebaseApp.configure()
        print("configured firebase")

        return true
    }
}

