//
//  Notification_Menu_ViewModel.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 8.09.2023.
//

import SwiftUI
import UserNotifications

struct Notification_Menu_ViewModel{
    func setmenu (){
      
        let soru1 = UNNotificationAction(identifier: "evet", title: "EVET", options: .foreground)
        let soru2 = UNNotificationAction(identifier: "hayir", title: "HAYIR", options: .foreground)
        let soru3 = UNNotificationAction(identifier: "kapat", title: "KAPAT", options: .destructive)
        
        let kategori = UNNotificationCategory(identifier: "kategori", actions: [soru1,soru2,soru3], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([kategori])
    }
    
  
    
}
