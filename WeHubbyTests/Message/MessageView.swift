//
//  MessageView.swift
//  WeHubbyTests
//
//  Created by apprenant66 on 23/06/2022.
//

import SwiftUI

struct MessageView: View {
    var friend : Friends
    @State var test : String = ""
    var body: some View {
        VStack {
        HStack(alignment: .center) {
            Image("\(friend.userPicture)")
                .resizable()
                .clipShape(Circle())
                .frame(width: 56, height: 56, alignment: .center)
                .padding(2)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("\(friend.userPsedo)")
                    .font(.title2)
                    .bold()
                HStack {
                    Text(friend.userTag[0].rawValue)
                        .fontWeight(.semibold)
                        .padding(.vertical, 5.0)
                        .padding(.horizontal, 10.0)
                        .background(.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    Text(friend.userTag[0].rawValue)
                        .fontWeight(.semibold)
                        .padding(.vertical, 5.0)
                        .padding(.horizontal, 10.0)
                        .background(.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            }
            Image(systemName: "phone")
                .font(.title)
            Image(systemName: "video")
                .font(.title)
        }
          Spacer()
            MessageBoxView(isSend: true,textMessage: "Hola amigo")
            MessageBoxView(isSend: false, textMessage: "Je parle pas espagnol du coup")
            MessageBoxView(isSend: false, textMessage: "Donde esta koi ? ")
            
        TextField("Type text here", text: $test)
                .padding()
                
        }
        }
    }


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(friend : userProfiles[2])
    }
}
