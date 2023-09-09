//
//  ContentView.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 7.09.2023.
//

import SwiftUI
import UserNotifications

struct ContentView: View {

    @State var isPro = 0
    
    var toWant = Turkish_Model().words
    var toTranslate = English_Model().words
    var app_date_index = Date_Settings_ViewModel().get_current_day_index()
    @ObservedObject var notification_permission = Notification_Permission_ViewModel()
    init() {  notification_permission.get_permission() }
    var body: some View {
        VStack {
            HStack{
                Text("Bildirimce").font(.largeTitle)
                Spacer()
           
                
            }
           
        
            List((0..<app_date_index).reversed(),id: \.self){ index in
                Section(header: Text("Day \(index+1)")/*,footer: Text("EN: He is ready to jump. \nTR: Atlamaya hazır.")*/){
                    VStack(alignment: .leading){
                 
                          
                        Text("\(toTranslate[index]): \(toWant[index])")
                        .foregroundColor(.purple).font(.body.bold()).textCase(.uppercase)
                    
                        if(index == isPro){
                            Text("🇬🇧: He is ready to jump. \n🇹🇷: Atlamaya hazır.").foregroundColor(.orange)
                        }else{
                            HStack{
                                Text("🇬🇧: He is ready to jump. \n🇹🇷: Atlamaya hazır.").foregroundColor(.orange).blur(radius: 3.5)
                                
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



