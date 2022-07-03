//
//  MessageView.swift
//  WeHubbyTests
//
//  Created by apprenant66 on 23/06/2022.
//

import SwiftUI

struct MessageView: View {
    
    var user : Friends
    
    @State var test : String = ""
    
    @State var allMessagesView: [Tchat] = []
    
    @State private var textMessage: String = ""
    
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
                
                Image("\(user.userPicture)")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .clipped()
                    .frame(width: 60, height: 60, alignment: .center)
                    .padding(2)
                    .background(Color.accentColor)
                    .clipShape(Circle())
                
                Text("\(user.userPsedo)")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("lightgray"))
                        .cornerRadius(16)
                        .frame(width: 100, height: 44, alignment: .center)
                    HStack {
                        
                        Image(systemName: "phone.fill")
                            .font(.system(size: 24))
                        
                        Divider().frame(maxHeight: 35)
                        
                        Image(systemName: "video.fill")
                            .font(.system(size: 24))
                        
                        
                        
                        
                    }
                    
                }
            }
            .padding(.trailing, 10)
            
            Divider()
            
            ScrollViewReader { value in
                ScrollView {
                    
                    VStack(spacing: 10) {
                        
                        
                        ForEach(allMessagesView) { messages in
                            
                            if messages.userChat.id == userProfiles[0].id {
                                
                                HStack{
                                    Text(messages.message)
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.accentColor)
                                        .cornerRadius(24)
                                        .frame(maxWidth: UIScreen.main.bounds.width - 25, alignment: .trailing)
                                        .padding(.trailing, 5)
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(messages.message)
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(.gray)
                                        .cornerRadius(24)
                                        .frame(maxWidth: UIScreen.main.bounds.width - 25, alignment: .leading)
                                        .padding(.leading, 5)
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            }
                            
                        }
                        .onAppear {
                            value.scrollTo(allMessagesView.last?.id, anchor: .bottom)
                            
                            
                        }
                        .onChange(of: allMessagesView) { newValue in
                            DispatchQueue.main.async {
                                value.scrollTo(allMessagesView.last?.id, anchor: .bottom)
                            }
                            
                        }
                    }
                    
                }
            }
            .padding(.vertical)
            
            Spacer()
            
            VStack {
                HStack{
                    TextField("Tapez votre message ici...", text: $textMessage)
                        .foregroundColor(.black)
                        .padding(.vertical, 7)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(20)
                        .onSubmit {
                            allMessagesView.append(Tchat(userChat: userProfiles[0], message: textMessage))
                            textMessage = ""
                            
                            
                        }
                    
                    Button {
                        
                    } label : {
                        Image(systemName: "paperplane.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size:32))
                    }
                }
            }
            .padding()
            .background(Color.accentColor)
            .padding(.bottom, 15)
        }
        .navigationBarHidden(true)
        
        .onAppear{
            
            self.allMessagesView = allMessages[user.id]!
            
            
        }
        
    }
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(user : userProfiles[1])
    }
}
