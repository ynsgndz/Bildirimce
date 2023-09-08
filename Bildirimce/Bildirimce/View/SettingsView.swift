//
//  SettingsView.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 8.09.2023.
//

import SwiftUI
 

struct SettingsView: View {
 
    var body: some View {
        VStack{
      Text("Settings")
            Spacer()
            Text("Bildirimce learning app  V0.0.2 ").font(.system(size: 10))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
