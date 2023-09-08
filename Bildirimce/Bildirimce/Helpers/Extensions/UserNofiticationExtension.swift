//
//  UserNofiticationExtension.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 8.09.2023.
//

import SwiftUI
import UserNotifications

extension AppDelegate:UNUserNotificationCenterDelegate{
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner,.sound,.badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let app = UIApplication.shared
        if(app.applicationState == .active){
            print("Bildirime Uygulama aktifken tıklandı")
        }
        if(app.applicationState == .background){
            print("Bildirime Uygulama arkaplandayken tıklandı")
        }
        if(app.applicationState == .inactive){
            print("Bildirime Uygulama inaktifken tıklandı")
        }
        app.applicationIconBadgeNumber = 0
        
        
        if response.actionIdentifier == "evet"{
            print("Evet butonu secildi")
        }
        if response.actionIdentifier == "hayir"{
            print("hayir butonu secildi")
        }
        if response.actionIdentifier == "kapat"{
            print("kapat butonu secildi")
        }
        
        completionHandler()
        
    }
    
}
