//
//  HobbyDetailView.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//

import SwiftUI

struct HobbyDetailView: View {
    
    var tutosDetail: TutosDetail
   
    var body: some View {
    
        VStack (alignment: .leading){
            Text(tutosDetail.tutoTitle)
                .font(.title)
            HStack (alignment: .top) {
            Image(tutosDetail.creatorAvatar)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 30.0, alignment: .leading)
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 3)
                Text(tutosDetail.creator)
                Spacer()
                // Bouton Partager
            }
            .padding(.bottom, 2.0)
            
            Text(tutosDetail.tutoSubtitle)
                .font(.body)
                .fontWeight(.semibold)
                .padding(.bottom, 10.0)
            
           ScrollView (.horizontal) {
             HStack {
             ForEach(tutosDetail.tutoImageSecondary, id:\.self) {
                        image in Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 240)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay(
                            RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                           .shadow(radius: 3)
                }
            }
           }
            .padding(.vertical, 12)
            Text(tutosDetail.tutoTitleParagraph1)
                .font(.title2)
            Text(tutosDetail.tutoParagraph1)
                .padding(.bottom, 10)
            Text(tutosDetail.tutoTitleParagraph2)
                .font(.title2)
            Text(tutosDetail.tutoParagraph2)
                .padding(.bottom, 10)
            Text(tutosDetail.tutoTitleParagraph3)
                .font(.title2)
            Text(tutosDetail.tutoParagraph3)
        }
        // Sur le même thème
        // Tags
        .padding()
        }
        }

struct HobbyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HobbyDetailView(tutosDetail: listTutosDetail[2])
    }
}
