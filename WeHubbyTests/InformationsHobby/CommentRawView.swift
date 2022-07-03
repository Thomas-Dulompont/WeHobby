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
  
        
        HStack(spacing: 20) {
       
       Image(commentsHobby.user.userPicture)
           .resizable()
           .scaledToFit()
           .frame(width: 70)
           .clipShape(Circle())
           .clipped()
           .shadow(radius: 5)
                   
       VStack(alignment: .leading, spacing: 0) {
                       Text(commentsHobby.user.userPsedo)
                           .foregroundColor(.accentColor)
                       
                        Text(commentsHobby.commDetailHobby)
                           .font(.system(size: 14))
                           .foregroundColor(.black)
                           .frame(width: 260, height: 60)
                           .multilineTextAlignment(.leading)
                           .padding(.trailing, 10)
                   }
               }
   .padding(.horizontal)
           }
        }


struct CommentRawView_Previews: PreviewProvider {
    static var previews: some View {
        CommentRawView(commentsHobby: listCommentsHobby[0])
    }
}
