//
//  MainView.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 8.09.2023.
//

import SwiftUI
import UserNotifications

struct MainView: View {
  
    var body: some View {
        VStack{
            TabView{
                ContentView()
                    .tabItem {
                        Label("Main", systemImage: "list.bullet.rectangle.portrait")
                    }
                    SettingsView()
                    .tabItem {
                            Label("Settings", systemImage: "ellipsis.rectangle")
                        }

                    
                }
            }
        }
       
         
        
    }


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
