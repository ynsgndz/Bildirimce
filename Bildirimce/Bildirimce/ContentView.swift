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
    @State var izinVerildimi = false
   
    let calendar = Calendar.current
    let currentDate = Date()

    let ingilizce_kelime = [
        "run", "jump", "eat", "swim", "sing", "dance", "sleep", "read", "write", "talk",
        "apple", "car", "book", "dog", "cat", "house", "tree", "flower", "friend", "computer",
        "quickly", "slowly", "loudly", "quietly", "often", "always", "never", "well", "badly", "carefully",
        "play", "work", "study", "listen", "speak", "think", "drive", "fly", "travel", "run",
        "pencil", "phone", "chair", "table", "shirt", "shoes", "hat", "glasses", "clock", "bag",
        "happily", "sadly", "angrily", "kindly", "suddenly", "calmly", "nervously", "cheerfully", "usually", "rarely",
        "ball", "bike", "train", "bus", "plane", "boat", "subway", "taxi", "library", "school",
        "today", "tomorrow", "yesterday", "morning", "afternoon", "evening", "night", "week", "month", "year",
        "breakfast", "lunch", "dinner", "water", "coffee", "tea", "juice", "milk", "soup", "bread",
        "happy", "sad", "angry", "kind", "sudden", "calm", "nervous", "cheerful", "usual", "rare"
    ]

  
    
    let turkce_anlam = [
        "koşmak", "atlamak", "yemek", "yüzmek", "şarkı söylemek", "dans etmek", "uyumak", "okumak", "yazmak", "konuşmak",
        "elma", "araba", "kitap", "köpek", "kedi", "ev", "ağaç", "çiçek", "arkadaş", "bilgisayar",
        "hızlıca", "yavaşça", "yüksek sesle", "sessizce", "sık sık", "her zaman", "asla", "iyi", "kötü", "dikkatli bir şekilde",
        "oynamak", "çalışmak", "çalışmak", "dinlemek", "konuşmak", "düşünmek", "sürmek", "uçmak", "seyahat etmek", "koşmak",
        "kalem", "telefon", "sandalye", "masa", "gömlek", "ayakkabı", "şapka", "gözlük", "saat", "çanta",
        "mutlu bir şekilde", "üzgün bir şekilde", "öfkeli bir şekilde", "nazik bir şekilde", "ani bir şekilde", "sakin bir şekilde", "sinirli bir şekilde", "neşeli bir şekilde", "genellikle", "nadiren",
        "top", "bisiklet", "tren", "otobüs", "uçak", "tekne", "metro", "taksi", "kütüphane", "okul",
        "bugün", "yarın", "dün", "sabah", "öğleden sonra", "akşam", "gece", "hafta", "ay", "yıl",
        "kahvaltı", "öğle yemeği", "akşam yemeği", "su", "kahve", "çay", "meyve suyu", "süt", "çorba", "ekmek",
        "mutlu", "üzgün", "sinirli", "nazik", "ani", "sakin", "sinirli", "neşeli", "sık", "nadiren"
    ]
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]){ succes , error in
            if succes {
             
                print("Bildirim izni var")
            }else{
                print("Bildirim izni yok")
            }
            DispatchQueue.main.async {
                let app = UIApplication.shared
                app.applicationIconBadgeNumber = 0
            }
          
        }
        print(ingilizce_kelime.count)
        print(turkce_anlam.count)
    }
    var body: some View {
        VStack {
            Button(button_text){
                
                guard izinVerildimi else {
                    
                    return}
                let bildirim =  UNMutableNotificationContent()
                let soru1 = UNNotificationAction(identifier: "evet", title: "EVET", options: .foreground)
                let soru2 = UNNotificationAction(identifier: "hayir", title: "HAYIR", options: .foreground)
                let soru3 = UNNotificationAction(identifier: "kapat", title: "KAPAT", options: .destructive)
                
                let kategori = UNNotificationCategory(identifier: "kategori", actions: [soru1,soru2,soru3], intentIdentifiers: [], options: [])
                UNUserNotificationCenter.current().setNotificationCategories([kategori])
                
                
                
              
                var bugun = ( calendar.ordinality(of: .day, in: .year, for: currentDate)! - 251)
                
                bildirim.title = "HER GÜN 1 İNGİLİZCE KELİME"
                bildirim.subtitle = ""
                bildirim.body = """
                                    🇬🇧 \(ingilizce_kelime[bugun].capitalized)
                                    🇹🇷 \(turkce_anlam[bugun].capitalized)
                                    """
                bildirim.badge = 1
                bildirim.sound = UNNotificationSound.default
                bildirim.categoryIdentifier = "kategori"
                // zamansal tekrar
                var date = DateComponents()
              //  date.day = 1
              //  date.month = 1
              //  date.year = 2023
                date.hour = 11
               // date.minute = 6
                 //date.second = 5
                let tarih = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            
                let zaman = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false) // 24 * 3600  = 24 saat sanirim
                let id = UNNotificationRequest(identifier: "kelime", content: bildirim, trigger: tarih)
                
                UNUserNotificationCenter.current().add(id)
                
                print("Butona tiklandi")
            }
           
        
            List(0..<( calendar.ordinality(of: .day, in: .year, for: currentDate)! - 250),id: \.self){ index in
               Text("\(ingilizce_kelime[index]): \(turkce_anlam[index])")
            }
        }
        .padding()
        .onAppear{
            UNUserNotificationCenter.current().requestAuthorization { (granted, error) in
                self.izinVerildimi = granted
                if izinVerildimi {
                    self.button_text = "Bildirim al"
                    print("Bildirim izni var")
                    
                     
                      
                }else{
                    print("Bildirim izni yok")
                    self.button_text = "Ayarlardan Bildirimlere izin vermeniz gerekmektedir"
                     
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension AppDelegate:UNUserNotificationCenterDelegate{
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner,.sound,.badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let app = UIApplication.shared
        if(app.applicationState == .active){
            print("Bildirime Uygulama aktifken tıklandı")
        }
        if(app.applicationState == .background){
            print("Bildirime Uygulama arkaplandayken tıklandı")
        }
        if(app.applicationState == .inactive){
            print("Bildirime Uygulama inaktifken tıklandı")
        }
        app.applicationIconBadgeNumber = 0
        
        
        if response.actionIdentifier == "evet"{
            print("Evet butonu secildi")
        }
        if response.actionIdentifier == "hayir"{
            print("hayir butonu secildi")
        }
        if response.actionIdentifier == "belki"{
            print("belki butonu secildi")
        }
        
        completionHandler()
        
    }
    
}


