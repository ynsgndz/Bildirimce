//
//  ContentView.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 7.09.2023.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State var button_text = "Bildirim al"
    
    var notification_content = Notification_Content_ViewModel()
    var toWant = Turkish_Model().words
    var ToTranslate = English_Model().words
    var app_date_index = Date_Settings_ViewModel().get_current_day_index()
    var notification_set_menu = Notification_Menu_ViewModel()
    @ObservedObject var notification_permission = Notification_Permission_ViewModel()
 
    init() {  notification_permission.get_permission() }
    var body: some View {
        VStack {
            HStack{
                Text("Bildirimce").font(.largeTitle)
                Spacer()
                Button {
                    guard notification_permission.permission_status else { return}
                    
                    notification_set_menu.setmenu()
                    notification_content.set_content()
                    
                    print("Butona tiklandi")
                } label: {
                    if(notification_permission.permission_status){
                        Text( "✅")
                    }else{
                        Text( "☑️" )
                    }
                }.frame(width: 50,height: 30)
                    .background().padding(.trailing, 5)
                
                
            }
           
        
            List(0..<app_date_index,id: \.self){ index in
                Section(header: Text("Word List"),footer: Text("My Word History")){
                    Text("\( toWant[index] ): \(ToTranslate[index])").textCase(.uppercase).foregroundColor(.purple)
                }
            }.listStyle(DefaultListStyle())
                .background(Color.white.opacity(1))
        }
        .padding()
         
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



