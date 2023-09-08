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
    var app_date_index = Date_Settings_ViewModel().get_current_day_index()
    func set_content() {
        bildirim.title = "HER GÜN 1 İNGİLİZCE KELİME"
        bildirim.subtitle = ""
        bildirim.body = """
                            🇬🇧 \(self.english[app_date].capitalized)
                            🇹🇷 \(self.turkish[app_date].capitalized)
                            """
        bildirim.badge = 1
        bildirim.sound = UNNotificationSound.default
        bildirim.categoryIdentifier = "kategori"
        // zamansal tekrar
        let date = DateComponents()
           //  date.day = 1
          //  date.month = 1
         //  date.year = 2023
        //  date.hour = 11
       //  date.minute = 6
      //  date.second = 5
    //   let tarih = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)

        let zaman = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false) // 24 * 3600  = 24 saat sanirim
        let id = UNNotificationRequest(identifier: "kelime", content: bildirim, trigger: zaman)
        
        UNUserNotificationCenter.current().add(id)
    }
 
    
    
}
