//
//  HobbyView.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//

import SwiftUI

struct HobbyView: View {
   
    var loisirs: Hobbies
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    Text(loisirs.tutoHobby[0].tutoTitle)
                    .font(.title2)
                    
                    NavigationLink  {
                        HobbyDetailView(loisirs: loisirs)
                    } label: {
                        Image(loisirs.tutoHobby[0].tutoImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 240)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                    }
                    
                    Text(loisirs.tutoHobby[0].tutoSubtitle)
                    .font(.body)
                    .italic()
                }
                
                Spacer().frame(height: 20)
                
                HStack {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0.0) {
                        Text(loisirs.tutoHobby[0].creator)
                        Text(loisirs.tutoHobby[0].tutoDuration)
                                .font(.callout)
                                .fontWeight(.thin)
                                .multilineTextAlignment(.leading)
                    }
                    .padding(-15.0)
                    Image(loisirs.tutoHobby[0].creatorAvatar)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 70.0)
                }
                
                Spacer().frame(height: 40)
                
                // Liste Tuto View
                //ListeTutosDetail(listTutos: tutosDetail.tutos)
            }
            .padding()
        }
    }
}

struct HobbyView_Previews: PreviewProvider {
    static var previews: some View {
        HobbyView(loisirs:loisirs[0])
    }
}
