//
//  DetailListMessage.swift
//  WeHubbyTests
//
//  Created by apprenant66 on 22/06/2022.
//

import SwiftUI

struct DetailListMessage: View {
    var friend : Friends
  
    var body: some View {
        
       
      
       
     
        ZStack(alignment: .bottomTrailing){
                
                HStack {
                    
                    ZStack(alignment: .bottomTrailing) {
            Image("\(friend.userPicture)")
                .resizable()
                .clipShape(Circle())
                .frame(width: 80, height: 80, alignment: .center)
                .padding(2)
       
                        if friend.isOnline == true {
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.green)
                        }
                        else {
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.red)
                        }
                
                    }
            VStack(alignment: .leading, spacing: 1){
            Text("\(friend.userPsedo)")
                    .font(.title2)
                    .bold()
                
                Text(friend.userBio)
                    .font(.title2)
                    .foregroundColor(.gray)
                    
                 

                    .frame(minWidth: 40, idealWidth: .infinity, maxWidth: 150, minHeight: 40, idealHeight: 40, maxHeight: 40, alignment: .leading)
                    
            }
                
        }
       
        }.padding()
        
    }
    }


struct DetailListMessage_Previews: PreviewProvider {
    static var previews: some View {
        DetailListMessage(friend: userProfiles[0])
    }
}
