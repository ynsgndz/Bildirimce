//
//  SettingsView.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 8.09.2023.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    @State var button_text = "Bildirim al"
    @State var hour = 1
    @State var minute = 0
    var notification_content = Notification_Content_ViewModel()
    var notification_set_menu = Notification_Menu_ViewModel()
    @ObservedObject var notification_permission = Notification_Permission_ViewModel()
    @Environment(\.openURL) var openURL
    //  init() {  notification_permission.get_permission() }
    
    
    var body: some View {
   
        VStack{
            Text("Settings").padding(.all,10).font(.largeTitle).foregroundColor(Color.purple)
            
           
                VStack{
                
                    VStack(alignment: .center){
                        Text("Notification Time: ").foregroundColor(Color.orange)
                        HStack{
                           
                            if(hour <= 9){Text("0\(hour)")} else{ Text("\(hour)") }
                            Text(" : ")
                            if(minute <= 9){ Text("0\(minute)") } else{Text("\(minute)") }
                        }.font(.largeTitle).foregroundColor(Color.orange)
                    }
                    VStack{
                      
                        Stepper(value:$hour, in: 0...23){Text("HOUR:")}
                        Stepper(value:$minute, in: 0...59,step: 15){Text("MINUTE:")
                            
                            
                        }
                            
                         
                       
                    }.padding(10).foregroundColor(Color.orange)
                    
                    Button{
                        
                    }label:{
                        Text("🔒SAVE")
                        Text("(PREMIUM)").font(Font.title3).opacity(0.4)
                    }.foregroundColor(Color.orange)
                   
                } .blur(radius: 1.0)
                
           
               
             
            Spacer()
               
            Divider()
            HStack{
                Button{
                    
                }label:{
                    Text("Get a premium (")
                    Text("1.99$").strikethrough(true)
                    Text("/ 0.99$ )")
                    
                }.padding(10)
                    
                .foregroundColor(Color.purple)
                .background(Color.orange)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    
            }
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Divider()
                
            Spacer()
            Divider()
            Button {
                guard notification_permission.permission_status else  {  return openURL(URL(string: UIApplication.openSettingsURLString)!) }
                     
                
                
                notification_set_menu.setmenu()
                notification_content.set_content()
                
                print("Butona tiklandi")
                
            } label: {
                HStack{
                    Text("Notification permission: ")
                    Spacer()
               
                if(notification_permission.permission_status){
                       Text( "✅")
                    
                }else{
                    
                    Text(  "Not! ☑️" )
                    
                }
                }.foregroundColor(Color.purple)
                 
            }.buttonStyle(.bordered)
                .padding(10)
                .tint(Color.white)
           
            VStack{
                Divider()
                Text("Bildirimce learning app  v0.0.3.2 ").font(.system(size: 10)).padding(.top,10)
                Divider()
            }
           
        }.onAppear(perform: notification_permission.get_permission ).padding(10)
      
    }
   
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
