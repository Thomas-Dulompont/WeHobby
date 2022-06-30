//
//  BulleMessageView.swift
//  WeHubbyTests
//
//  Created by apprenant66 on 21/06/2022.
//

import SwiftUI


struct DetailsBulleMessage: View {
    var friend : Friends
    var body: some View {
        
        
        
        if friend.isCurrentUser == false {
        VStack {
            Image("\(friend.userPicture)")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .clipped()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: .gray, radius: 5, y: 5)
            
            Text("\(friend.userPsedo)")
                .fontWeight(.semibold)
            
        }.padding(4)
        
        } else {
            Text("")
        }
    }
        
}

struct BulleMessageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsBulleMessage(friend : userProfiles[2])
    }
}
