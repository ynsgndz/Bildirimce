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
    
    func get_current_day_index() -> Int {
        let bugun = ( calendar.ordinality(of: .day, in: .year, for: currentDate)! - 250)
        return bugun
    }
   
    func get_current_day() -> Int {
        let bugun = ( calendar.ordinality(of: .day, in: .year, for: currentDate)! - 251)
     
        return bugun
    }
}
