//
//  Notification_Permission_ViewModel.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 8.09.2023.
//

import SwiftUI
import UserNotifications

class Notification_Permission_ViewModel: ObservableObject {
    
    @Published var permission_status = false
    func get_permission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]){ [self] succes , error in
            if succes {
                print("Bildirim izni var")
                DispatchQueue.main.async { [self] in
                    self.permission_status = true
                   
                    
                }
                   
                 
               
            }else{
                print("Bildirim izni yok")
                
                DispatchQueue.main.async { [self] in
                    self.permission_status = false
                }
               
            }
            DispatchQueue.main.async {
                let app = UIApplication.shared
                app.applicationIconBadgeNumber = 0
            }
          
        }
    }
   
    
 
}
