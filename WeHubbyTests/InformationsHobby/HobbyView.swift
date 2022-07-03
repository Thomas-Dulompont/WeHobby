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
    
    var width: CGFloat = UIScreen.main.bounds.width

    
    var body: some View {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            Text(loisirs.tutoHobby[0].tutoTitle)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                            
                            NavigationLink  {
                                HobbyDetailView(loisirs: loisirs)
                            } label: {
                                Image(loisirs.tutoHobby[0].tutoImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width, height: 250)
                                    .clipped()
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                    .padding(.bottom, 10)

                            }
                            
                            Text(loisirs.tutoHobby[0].tutoSubtitle)
                            .font(.body)
                        }
                        
                        Spacer().frame(height: 20)
                        
                        HStack {
                            Spacer()
                            VStack(alignment: .trailing, spacing: 0.0) {
                                Text(loisirs.tutoHobby[0].creator)
                                    .foregroundColor(.gray)
                                    .italic()
                                
                                HStack(spacing: 4){
                                    
                                    Image(systemName: "timer")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                    
                                Text(loisirs.tutoHobby[0].tutoDuration)
                                        .font(.callout)
                                        .fontWeight(.thin)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .padding(.trailing, -5.0)
                            Image(loisirs.tutoHobby[0].creatorAvatar)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .cornerRadius(50)
                                .clipped()
                        }
                        .padding(.trailing, 10)
                        
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
