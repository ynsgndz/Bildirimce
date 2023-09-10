//
//  SaveView.swift
//  Bildirimce
//
//  Created by Yunus Gündüz on 10.09.2023.
//

import SwiftUI

struct SaveView: View {
    var body: some View {
        VStack(alignment: .center){
            HStack{
                Text("Kayıtlı kelimelerim").font(.largeTitle)
                    .foregroundColor(Color.purple).padding(10)
                Spacer()
            }
              
               
            Spacer()
            Text("PREMIUM OL !")
            Spacer()
            
        }
    }
}

struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveView()
    }
}
