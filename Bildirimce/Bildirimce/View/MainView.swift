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
                        Label("KELİMELER", systemImage: "list.bullet.circle")
                    }
                
                SaveView().tabItem{
                    Label("KAYITLILAR", systemImage: "bookmark.circle")
                    
                }
                
                
                ProfileView()
                    .tabItem {
                            Label("PROFIL", systemImage: "person.crop.circle.badge.checkmark")
                            
                        }

                    
                }.accentColor(Color.purple)
            }
        }
       
         
        
    }


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
