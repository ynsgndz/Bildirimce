//
//  Notification_Content_ViewModel.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 8.09.2023.
//

import Foundation
import SwiftUI
import UserNotifications


struct Notification_Content_ViewModel{
    var turkish = Turkish_Model().words
    var english = English_Model().words
    let bildirim =  UNMutableNotificationContent()
    var app_date = Date_Settings_ViewModel().get_current_day()
    @State var app_install_day = UserDefaults.standard.integer(forKey: "user_defaults_install_day")
    func set_content() {
        bildirim.title = "HER GÜN 1 KELİME"
        bildirim.subtitle = ""
        bildirim.body = """
                            🇬🇧 \(self.english[app_date-app_install_day].capitalized)
                            🇹🇷 \(self.turkish[app_date-app_install_day].capitalized)
                            """
        bildirim.badge = 1
        bildirim.sound = UNNotificationSound.default
        bildirim.categoryIdentifier = "kategori"
       

        let zaman = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false) // 24 * 3600  = 24 saat sanirim
        let id = UNNotificationRequest(identifier: "kelime", content: bildirim, trigger: zaman)
        
        UNUserNotificationCenter.current().add(id)
    }
    func set_content_day(notification_hour:Int, notification_minute:Int) {
        bildirim.title = "HER GÜN 1 KELİME"
        bildirim.subtitle = ""
        bildirim.body = """
                            🇬🇧 \(self.english[app_date-app_install_day].capitalized)
                            🇹🇷 \(self.turkish[app_date-app_install_day].capitalized)
                            """
        bildirim.badge = 1
        bildirim.sound = UNNotificationSound.default
        bildirim.categoryIdentifier = "kategori"
        // zamansal tekrar
              var date = DateComponents()
           //  date.day = 1
          //  date.month = 1
         //  date.year = 2023
          date.hour = notification_hour
         date.minute = notification_minute
      //  date.second = 5
        let tarih = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)

        let id = UNNotificationRequest(identifier: "kelime", content: bildirim, trigger: tarih)
        
        UNUserNotificationCenter.current().add(id)
    }
 
    
    
}
