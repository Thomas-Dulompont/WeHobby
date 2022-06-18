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
                    .frame(width: 130, height:125)
                    .clipped()
            }
            Button {
                
            } label : {
                Image(systemName: "camera.fill")
                    .font(.system(size:24))
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.accentColor)
                    .clipShape(Circle())
                    .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                    
            }.offset(y: -120)
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
