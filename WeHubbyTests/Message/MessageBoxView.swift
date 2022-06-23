//
//  MessageBoxView.swift
//  WeHubbyTests
//
//  Created by apprenant66 on 23/06/2022.
//

import SwiftUI

struct MessageBoxView: View {
    var isSend : Bool = true
    var textMessage : String = ""
    var body: some View {
        
        
        if isSend == true {
            HStack{
            Spacer()
            Text(textMessage)
            .bold()
            .foregroundColor(.white)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(24)
            }.padding()
            
    }
        else {
            HStack {
            Text(textMessage)
            .bold()
            .foregroundColor(.white)
            .padding()
            .background(.gray)
            .cornerRadius(24)
            Spacer()
            
            }.padding()
        }
    }
}

struct MessageBoxView_Previews: PreviewProvider {
    static var previews: some View {
        MessageBoxView()
    }
}
