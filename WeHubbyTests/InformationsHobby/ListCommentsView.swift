//
//  ListCommentsView.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//

import SwiftUI

struct ListCommentsView: View {
    var listCommentsHobby: [CommentsHobby]
    var body: some View {

          ScrollView {
                    ForEach(listCommentsHobby) { commentsHobby in
                        CommentRawView(commentsHobby: commentsHobby)
                   }
               }
          .padding()
            }
        }


struct ListCommentsView_Previews: PreviewProvider {
    static var previews: some View {
        ListCommentsView(listCommentsHobby: listCommentsHobby)
    }
}
