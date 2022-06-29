//
//  HobbyDetailView.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//

import SwiftUI

struct HobbyDetailView: View {
    
    var loisirs: Hobbies
   
    var body: some View {
    
        VStack (alignment: .leading){
            Text(loisirs.tutoHobby[0].tutoTitle)
                .font(.title)
            HStack (alignment: .top) {
                Image(loisirs.tutoHobby[0].creatorAvatar)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 30.0, alignment: .leading)
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 3)
                Text(loisirs.tutoHobby[0].creator)
                Spacer()
                // Bouton Partager
            }
            .padding(.bottom, 2.0)
            
            Text(loisirs.tutoHobby[0].tutoSubtitle)
                .font(.body)
                .fontWeight(.semibold)
                .padding(.bottom, 10.0)
            
            Text(loisirs.tutoHobby[0].tutoTitleParagraph1)
                .font(.title2)
            Text(loisirs.tutoHobby[0].tutoParagraph1)
                .padding(.bottom, 10)
            Text(loisirs.tutoHobby[0].tutoTitleParagraph2)
                .font(.title2)
            Text(loisirs.tutoHobby[0].tutoParagraph2)
                .padding(.bottom, 10)
            Text(loisirs.tutoHobby[0].tutoTitleParagraph3)
                .font(.title2)
            Text(loisirs.tutoHobby[0].tutoParagraph3)
        }
        
        .padding()
    }
}

struct HobbyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HobbyDetailView(loisirs: loisirs[0])
    }
}
