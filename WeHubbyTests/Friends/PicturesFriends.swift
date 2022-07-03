//
//  PicturesFriends.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import SwiftUI

struct PicturesFriends: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var user: Friends
    
    @State private var isOpen = false
    
    var width: CGFloat = UIScreen.main.bounds.width
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack{
            //Spacer()
            ScrollView(.vertical, showsIndicators: false){
                ZStack {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 2) {
                        
                        ForEach(user.pictures, id: \.self) { picture in
                            
                            Image(picture)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 125, height:125)
                                .clipped()
                                .onTapGesture {
                                    print("Ranking")
                                    self.isOpen.toggle()
                                }
                                .fullScreenCover(isPresented: $isOpen, content: {
                                    withAnimation {
                                        ZStack{
                                            Button {
                                                self.isOpen.toggle()
                                            } label : {
                                                Image(picture)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: width)
                                                    .clipped()
                                                
                                            }.background(.ultraThinMaterial)
                                        }
                                    }
                                })
                        }
                        
                        
                    }
                }
            }
        }
    }
}

struct PicturesFriends_Previews: PreviewProvider {
    static var previews: some View {
        PicturesFriends(user: userProfiles[0])
    }
}
