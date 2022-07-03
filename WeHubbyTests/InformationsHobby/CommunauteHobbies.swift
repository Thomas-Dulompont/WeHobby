//
//  CommunauteHobbies.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 03/07/2022.
//

import SwiftUI

struct CommunauteHobbies: View {
    
    var hobby : Hobbies
    
    @Environment(\.dismiss) var dismiss

    var body: some View {

        VStack {
            HStack(spacing: 16) {
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward") // set image here
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.accentColor)
                        .font(.system(size:24))
                        .padding(8)
                }
                
                Spacer()
                
                Text("Communauté")
                    .fontWeight(.bold)
                    .font(.system(size:32))
                    .foregroundColor(.accentColor)
            }
            .padding(.trailing, 90)
            
            Divider()
            
            ScrollView(.vertical, showsIndicators: false) {
            
                HStack{
            Text("Commentaires (\(listCommentsHobby.count))")
                    .foregroundColor(.accentColor)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    
                    Spacer()
                }
                .padding(.leading, 24)
                
                ForEach(listCommentsHobby) { comment in
                    
                    NavigationLink {
                        ProfilAmis(friend: comment.user)
                    } label: {
                        HStack(spacing: 20) {
                            Image(comment.user.userPicture)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70)
                                .clipped()
                                .clipShape(Circle())
                            
                            
                            VStack(alignment: .leading, spacing: 0){
                                
                                Text(comment.user.userPsedo)
                                    .foregroundColor(.accentColor)
                                
                                
                                Text(comment.commDetailHobby)
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                                    .frame(width: 260, height: 60)
                                    .multilineTextAlignment(.leading)
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                    Divider().frame(width: 260)
                }
                .padding(.horizontal, 20)
                
                HStack {
                    
                    Spacer()
                    
                    Button {
                        
                    } label : {
                    Text("Ajouter un commentaire")
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                        .underline()
                    }
                }
                .padding(.trailing, 30)
                
                HStack{
                    
            Text("Galerie")
                    .foregroundColor(.accentColor)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.leading, 24)
                
                PicutresHobbies()
                
            }
            

            .navigationBarHidden(true)
        }

    }
}

struct CommunauteHobbies_Previews: PreviewProvider {
    static var previews: some View {
        CommunauteHobbies(hobby: loisirs[0])
    }
}
