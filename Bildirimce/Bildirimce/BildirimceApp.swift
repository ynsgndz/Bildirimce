//
//  BildirimceApp.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 7.09.2023.
//

import SwiftUI

@main
struct BildirimceApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var app_delegate
    
    var body: some Scene {
        WindowGroup {
            MainView().onDisappear{
               
            }
                
        }
    }
}

class AppDelegate : NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
}

