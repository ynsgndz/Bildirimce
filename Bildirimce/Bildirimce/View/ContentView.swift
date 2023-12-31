//
//  ContentView.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 7.09.2023.
//

import SwiftUI
import UserNotifications

struct ContentView: View {

    @State var is_premium = true
    @State var is_saved = true
    @State var app_install_day = UserDefaults.standard.integer(forKey: "user_defaults_install_day")
    var toWant = Turkish_Model().words
    var toTranslate = English_Model().words
    var app_date = Date_Settings_ViewModel().get_current_day()
    @ObservedObject var notification_permission = Notification_Permission_ViewModel()
    init() {  notification_permission.get_permission() }
    var body: some View {
        VStack {
            HStack{
                Text("Bildirimce").font(.largeTitle)
                    .foregroundColor(Color.purple)
                Spacer()
           
                
            }
           
        
            List((0..<((app_date-app_install_day)+1)).reversed(),id: \.self){ index in
                Section(header: Text("Day \(index+1)")/*,footer: Text("EN: He is ready to jump. \nTR: Atlamaya hazır.")*/){
                    VStack(alignment: .leading){
                 
                        Text("\(toTranslate[index]): \(toWant[index])")
                        .foregroundColor(.purple).font(.body.bold()).textCase(.uppercase)
                        
                        if(is_premium){
                            HStack{
                                
                              //      Text("🇬🇧: He is ready to jump. \n🇹🇷: Atlamaya hazır.").foregroundColor(.orange)
 
                                
                                Spacer()
                                /*
                                VStack{
                                    if(is_saved){ // coming soon
                                        Button{ is_saved.toggle() }label:{
                                            Image(systemName: "bookmark.square")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(Color.gray)
                                            
                                               
                                        }
                                    }else{
                                        Button{ is_saved.toggle()  }label:{
                                            Image(systemName: "bookmark.square")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(Color.purple)
                                             
                                            
                                        }
                                    }
                                }
                                */
                            }
                        }else{
                            
                            HStack{
                            //    Text("🇬🇧: He is ready to jump. \n🇹🇷: Atlamaya hazır.").foregroundColor(.orange).blur(radius: 3.5)
                                Spacer()
                                
                                Text("🔒PREMIUM").foregroundColor(Color.gray).font(Font.title3).opacity(0.4)
                            }
                            
                           
                        }
                        
                        
                        
                   }
                      }.foregroundColor(.black)
                    
            }.listStyle(PlainListStyle())
                .background(Color.white)
            
         
        }.background(.white)
        .padding()
         
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



