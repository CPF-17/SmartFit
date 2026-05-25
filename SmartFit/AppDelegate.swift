//
//  AppDelegate.swift
//  SmartFit
//
//  Created by John Law on 12/4/2017.
//  Copyright © 2017 CPF-17. All rights reserved.
//

import UIKit
import FirebaseCore
import GoogleSignIn

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        GIDSignIn.sharedInstance.handle(url)
    }
}
