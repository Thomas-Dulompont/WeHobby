//
//  ProfilAmis.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import SwiftUI

enum ViewButtonBis {
    case photos
    case futurs
    case past
}

struct ProfilAmis: View {
    
    var width: CGFloat = UIScreen.main.bounds.width
    var heigth: CGFloat = UIScreen.main.bounds.height
    
    @State var selectedTab: ViewButtonBis = .photos
    
    @State var currentTab = "Découvrir"
    
    @State var tabBarOffset: CGFloat = 0
    
    @Namespace var animation
    
    @State var imageName: String = "person.fill.badge.plus"

    
    var body: some View {
        if let user = userProfiles.first(where: { $0.isCurrentUser
        }){
            
            VStack (){
    
                Image(user.userCover)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: 250)
                    .clipped()
                    .ignoresSafeArea()
                    .zIndex(0)
                
                
                
                VStack {
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(32)
                    .offset(y: -80)
                    .frame(height: 100)
                VStack{
                    HStack(spacing: 30){
                        Button {
                            
                            if imageName == "person.fill.badge.plus" {
                                
                            imageName = "person.fill.badge.minus"
                            } else {
                                
                            imageName = "person.fill.badge.plus"
                            }
                            
                        } label : {
                            Image(systemName: imageName)
                                .font(.system(size:32))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(Circle())
                                .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                        }
                        .padding(.leading, 20)
                        
                        
                        Image(user.userPicture)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .shadow(color: .accentColor, radius: 6)
                            .padding(4)
                            .background(Color.accentColor)
                            .clipShape(Circle())
                            .offset(y: -25)
                        
                        
                        
                        Button {
                            
                        } label : {
                            Image(systemName: "ellipsis.bubble.fill")
                                .font(.system(size:32))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(Circle())
                                .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                        }
                        .padding(.trailing, 20)
                    }
                    VStack{
                        Text(user.userPsedo)
                            .font(.title)
                            .fontWeight(.medium)
                        
                        
                        HStack(spacing: 10){
                            
                            
                                
                            Text(user.userTag[0].rawValue)
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 5.0)
                                    .padding(.horizontal, 10.0)
                                    .background(.cyan)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            
                            Text(user.userTag[1].rawValue)
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 5.0)
                                    .padding(.horizontal, 10.0)
                                    .background(.cyan)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            
                            Text(user.userTag[2].rawValue)
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 5.0)
                                    .padding(.horizontal, 10.0)
                                    .background(.cyan)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            Text("+")
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 5.0)
                                    .padding(.horizontal, 10.0)
                                    .background(.cyan)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        
                        
                        Text(user.userBio)
                            .font(.system(size:16))
                            .frame(height: 70)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        
                        HStack{
                            Text("Loisirs favoris")
                                .foregroundColor(.accentColor)
                                .fontWeight(.bold)
                                .underline()
                                .frame(alignment: .leading)
                                .padding(.leading,15)
                            
                            Spacer()
                        }
                        
                        HStack(spacing: 20){
                            
                            ForEach(user.favoriteCategory) { favoris in
                                
                                Image(favoris.picCategory)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            Spacer()
                        }
                        .padding(.leading, 15)
                        .padding(.bottom, 10)
                        
                        VStack(spacing: 0){
                            ScrollView(.horizontal,showsIndicators: false) {
                                
                                HStack(spacing: 20){
                                    
                                    TabButtonBis(title: "Photos", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .photos)
                                    
                                    TabButtonBis(title: "Évènements futurs", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .futurs)
                                    
                                    TabButtonBis(title: "Évènements passés", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .past)
                                    
                                    
                                }
                                
                            }
                            
                            
                            Divider()
                        }
                    }
                    .offset(y: -35)
                }
                .offset(y: -200)
            }
            }
        }
    }
}
struct ProfilAmis_Previews: PreviewProvider {
    static var previews: some View {
        ProfilAmis()
    }
}

struct TabButtonBis: View {
    
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    @Binding var selectedTab: ViewButtonBis
    var buttonName: ViewButtonBis
    
    var body: some View {
        
        Button(action: {
            withAnimation{
                currentTab = title
            }
            selectedTab = buttonName
            
        }, label: {
            
            LazyVStack(spacing: 12){
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(currentTab == title ? .accentColor : .secondary)
                    .padding(.horizontal)
                
                if currentTab == title{
                    
                    Capsule()
                        .fill(Color.accentColor)
                        .frame(height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                    
                    
                } else {
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 1.2)
                }
            }
        })
    }
}


