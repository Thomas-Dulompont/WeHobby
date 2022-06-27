//
//  ListCommentsScrollView.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//

import SwiftUI

struct ListCommentsScrollView: View {

        var listCommentsHobby: [CommentsHobby]
        var body: some View {
            ScrollView {
                ForEach(listCommentsHobby) { commentsHobby in
                    CommentRawView(commentsHobby: commentsHobby)
                }
            }
        }
    }

   
struct ListCommentsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ListCommentsScrollView(listCommentsHobby: listCommentsHobby)
    }
}
