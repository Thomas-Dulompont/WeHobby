//
//  HobbyPresentation.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 03/07/2022.
//

import SwiftUI

struct HobbyPresentation: View {
    
    var hobbi : Hobbies
    var width: CGFloat = UIScreen.main.bounds.width
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                
                
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
                    
                    Image(hobbi.category.picCategory)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipped()
                        .padding(4)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                    
                    Text(hobbi.hobbyName)
                        .fontWeight(.bold)
                        .font(.system(size:32))
                        .foregroundColor(.accentColor)
                }
                .padding(.trailing, 90)
                
                Divider()
                HStack(spacing: 16) {
                    
                    
                    
                    ForEach(hobbi.hobbyTags, id: \.self) { tags in
                        
                        Text(tags.rawValue.uppercased())
                            .fontWeight(.semibold)
                            .padding(.vertical, 5.0)
                            .padding(.horizontal, 10.0)
                            .background(Color("CustomColorBlue"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                    }
                }
                
                Image(hobbi.hobbyPic)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: 250)
                    .clipped()
                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    .padding(.bottom, 10)
                
                
                Text("Qu'est-ce que la \(hobbi.hobbyName.lowercased())?")
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                    .font(.system(size:20))
                    .padding(.trailing, 100)
                
                Text(hobbi.hobbyDescription)
                    .frame(width: 326)
                
                
                Divider().frame(width:280)
                
                NavigationLink {
                    HobbyView(loisirs: hobbi, listTutos: listTutos)
                } label: {
                    HStack {
                        Text("Tutoriels")
                            .font(.system(size:18))
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size:18))
                            .foregroundColor(.gray)
                    }.padding(.horizontal)
                        .padding()
                        .background(Color("whitty"))
                        .cornerRadius(24)
                        .padding(.horizontal)
                }
                
                NavigationLink {
                    
                } label: {
                    HStack {
                        Text("Évènements")
                            .font(.system(size:18))
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size:18))
                            .foregroundColor(.gray)
                    }.padding(.horizontal)
                        .padding()
                        .background(Color("whitty"))
                        .cornerRadius(24)
                        .padding(.horizontal)
                    
                }
                
                NavigationLink {
                    
                } label: {
                    HStack {
                        Text("Communauté")
                            .font(.system(size:18))
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size:18))
                            .foregroundColor(.gray)
                    }.padding(.horizontal)
                        .padding()
                        .background(Color("whitty"))
                        .cornerRadius(24)
                        .padding(.horizontal)
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HobbyPresentation_Previews: PreviewProvider {
    static var previews: some View {
        HobbyPresentation(hobbi: loisirs[1])
    }
}
