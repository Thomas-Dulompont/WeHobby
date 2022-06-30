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
    
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                DescHobbyDetail(title: loisirs.tutoHobby[0].tutoTitle, description: loisirs.tutoHobby[0].tutoSubtitle, creator: loisirs.tutoHobby[0].creator, image: loisirs.tutoHobby[0].tutoImage)
                
                Divider()
                Spacer().frame(height: 30)
                
                TextHobbyDetail(title: loisirs.tutoHobby[0].tutoTitleParagraph1, paragraph: loisirs.tutoHobby[0].tutoParagraph1)
                
                TextHobbyDetail(title: loisirs.tutoHobby[0].tutoTitleParagraph2, paragraph: loisirs.tutoHobby[0].tutoParagraph2)
                
                TextHobbyDetail(title: loisirs.tutoHobby[0].tutoTitleParagraph3, paragraph: loisirs.tutoHobby[0].tutoParagraph3)
            }
        }
        .padding()
    }
}

struct HobbyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HobbyDetailView(loisirs: loisirs[0])
    }
}

struct DescHobbyDetail: View {
    var title: String
    var description: String
    var creator: String
    var image: String
    
    var body: some View {
        //Titre
        Text(title)
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(Color("CustomColorGreen"))
        
        //Auteur
        Text("Par : \(creator)")
            .padding(.bottom)
            .foregroundColor(.gray)
        
        //Description
        Text(description)
        .font(.body)
        
        //Image
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 375, height: 250)
            .cornerRadius(16)
            .clipped()

    }
}

struct TextHobbyDetail: View {
    var title: String
    var paragraph: String
    
    var body: some View {
        //Titre
        Text(title)
            .font(.title3)
            .fontWeight(.medium)
            .padding(.bottom, 1.0)
            .foregroundColor(Color("CustomColorGreen"))
            
        
        //Paragraphe
        Text(paragraph)
        
        //Separateur
        Divider()
        Spacer().frame(height: 30)
    }
}
