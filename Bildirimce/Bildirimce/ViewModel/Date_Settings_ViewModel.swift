//
//  Date_Settings_ViewModel.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 8.09.2023.
//

import Foundation
import SwiftUI

struct Date_Settings_ViewModel{
    let currentDate = Date()
    let calendar = Calendar.current
   
     
   
     func get_current_day() -> Int {
      
         let bugun = ( calendar.ordinality(of: .day, in: .year, for: currentDate)!)
        
     
             let user_defaults_today = UserDefaults.standard.integer(forKey: "user_defaults_install_day")
             if(user_defaults_today == 0 ){
                 print("Userdefaults 0 dı  değişti:  \(user_defaults_today)")
                  UserDefaults.standard.set(bugun, forKey: "user_defaults_install_day")
             }else{
                 print("UserDefaults 0 degil:  \(user_defaults_today)")
                 
             }
         
      
         print("bugun :  \(bugun)")
        
       
       
        return bugun
    }
}
