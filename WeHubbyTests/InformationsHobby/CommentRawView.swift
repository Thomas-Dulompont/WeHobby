//
//  CommentRawView.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//


import SwiftUI

struct CommentRawView: View {
    let commentsHobby: CommentsHobby
    var body: some View {
  
   HStack(alignment: .top) {
       Image(commentsHobby.user.userPicture)
                       .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                       .frame(width: 40.0, alignment: .leading)
                       .overlay(
                            Circle().stroke(Color.gray, lineWidth: 1))
                        .shadow(radius: 3)
                   
                   VStack(alignment: .leading) {
                       Text(commentsHobby.user.userPsedo)
                        Text(commentsHobby.commDetailHobby)
                   }
               }
               .frame(maxWidth: .infinity, alignment: .leading)
               .padding()
           }
        }


struct CommentRawView_Previews: PreviewProvider {
    static var previews: some View {
        CommentRawView(commentsHobby: listCommentsHobby[0])
    }
}
