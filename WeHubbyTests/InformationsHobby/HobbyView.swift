//
//  HobbyView.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//

import SwiftUI

struct HobbyView: View {
    
    var loisirs: Hobbies
    var listTutos: [Tutos]
    
    var body: some View {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            Text(loisirs.tutoHobby[0].tutoTitle)
                            .font(.title2)
                            
                            NavigationLink  {
                                HobbyDetailView(loisirs: loisirs)
                            } label: {
                                Image(loisirs.tutoHobby[0].tutoImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 375, height: 250)
                                    .cornerRadius(16)
                                    .clipped()
                            }
                            
                            Text(loisirs.tutoHobby[0].tutoSubtitle)
                            .font(.body)
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
                        ListeTutosDetail(listTutos: listTutos)
                    }
                    .padding()
    }
}

struct HobbyView_Previews: PreviewProvider {
    static var previews: some View {
        HobbyView(loisirs:loisirs[0], listTutos: listTutos)
    }
}
