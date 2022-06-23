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
        
        
        
        
        VStack {
            Image("\(friend.userPicture)")
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60, alignment: .center)
            
            Text("\(friend.userPsedo)")
            
        }.padding(5)
        
    }
}

struct BulleMessageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsBulleMessage(friend : userProfiles[2])
    }
}
