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
    
    @Environment(\.dismiss) var dismiss
      

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.backward") // set image here
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.accentColor)
                            .font(.system(size:24))
                            .padding(8)
                    }
                    }
                
                Image("\(friend.userPicture)")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .clipped()
                    .frame(width: 60, height: 60, alignment: .center)
                    .padding(2)
                    .background(Color.accentColor)
                    .clipShape(Circle())
                
                    Text("\(friend.userPsedo)")
                        .font(.title2)
                        .bold()
                
                Spacer()
                    
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("lightgray"))
                        .cornerRadius(16)
                        .frame(width: 100, height: 40, alignment: .center)
                    HStack {

                        Image(systemName: "phone.fill")
                            .font(.system(size: 20))
                        
                        Divider().frame(maxHeight: 35)
                        
                        Image(systemName: "video.fill")
                            .font(.system(size: 20))
                        

                        

                    }
                    
                }
            }
            .padding(.trailing, 10)

            Divider()
            
          Spacer()
            MessageBoxView(isSend: true,textMessage: "Hola amigo")
            MessageBoxView(isSend: false, textMessage: "Je parle pas espagnol du coup")
            MessageBoxView(isSend: false, textMessage: "Donde esta koi ? ")
            
        TextField("Type text here", text: $test)
                .padding()
                
        }
        .navigationBarHidden(true)
        
       
        }
    }


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(friend : userProfiles[1])
    }
}
