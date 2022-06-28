//
//  MonProfil.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 21/06/2022.
//

import SwiftUI

enum ViewButtonProfile {
    case photos
    case futurs
    case past
}

struct MonProfil: View {
    
    var width: CGFloat = UIScreen.main.bounds.width
    var heigth: CGFloat = UIScreen.main.bounds.height
    
    @State var selectedTab: ViewButtonProfile = .photos
    
    @State var currentTab = "Photos"
    
    @State var tabBarOffset: CGFloat = 0
    
    @Namespace var animation
    
    @State var imageName: String = "person.fill.badge.plus"
    
    
    var body: some View {
        
        
        if let user = userProfiles.first(where: { $0.isCurrentUser
        }){
            NavigationView {
            ZStack{
                
                VStack {
                Image(user.userCover)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: 300)
                    .clipped()
                    .ignoresSafeArea()
                    .zIndex(0)
                    
                    Spacer()
                }
                
                ZStack {
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        VStack{
                            HStack(spacing: 30){
                                
                                
                                Image(user.userPicture)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                                    .shadow(color: .accentColor, radius: 6)
                                    .padding(4)
                                    .background(Color.accentColor)
                                    .clipShape(Circle())
                                    .offset(x: 10, y: -25)
                                
                                
                                
                                NavigationLink {
                                    EditMypROFILE()
                                } label : {
                                    Image(systemName: "gearshape.2.fill")
                                        .font(.system(size:32))
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.accentColor)
                                        .clipShape(Circle())
                                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                                }
                                .padding(.trailing, 20)
                            }
                            .offset(x: 58)
                            VStack{
                                Text(user.userPsedo)
                                    .font(.title)
                                    .fontWeight(.medium)
                                
                                HStack {
                                    
                                    Image(systemName : "mappin.and.ellipse")
                                        .foregroundColor(.accentColor)
                                        .font(.callout)

                                    Text(user.ville)
                                        .foregroundColor(.accentColor)
                                        .font(.callout)
                                    
                                    
                                    
                                    Spacer()
                                }
                                .padding(.leading, 30)
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
                                            .frame(width: 40, height: 40)
                                    }
                                    Spacer()
                                }
                                .padding(.leading, 15)
                                .padding(.bottom, 10)
                                
                                VStack(spacing: 0){
                                    ScrollView(.horizontal,showsIndicators: false) {
                                        
                                        HStack(spacing: 20){
                                            
                                            TabButtonProfile(title: "Photos", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .photos)
                                            
                                            TabButtonProfile(title: "Évènements futurs", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .futurs)
                                            
                                            TabButtonProfile(title: "Évènements organisés", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .past)
                                            
                                            
                                        }
                                        
                                    }
                                    
                                    
                                    Divider()
                                    
                                    VStack {
                                        switch selectedTab {
                                        case .photos :
                                            
                                            PicturesFriends(user: user)
                                            
                                        case .futurs:
                                            Text("ok")
                                        case .past :
                                            Text("ko")
                                        }
                                    }
                                }
                            }
                            .offset(y: -35)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 32, style: .continuous)
                                .foregroundColor(.white)
                            //                                .frame(height: 100)
//                                .padding(.top, 15)
                        )
//                        .offset(y:170)
                        .padding(.top, 150)
                    }
//                    .offset(y: 170)
                    
                }
//                .offset(y:170)
                VStack {
                    Spacer()
                HStack {
                    
                    Spacer()
                    
            Button {
                
            } label : {
                Image(systemName: "camera.fill")
                    .font(.system(size:24))
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.accentColor)
                    .clipShape(Circle())
                    .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                    
            }
            .padding(.trailing, 15)
            .padding(.bottom, 15)
                }
                }
            }
            .navigationBarHidden(true)
        }
        }
    }
}

struct MonProfil_Previews: PreviewProvider {
    static var previews: some View {
        MonProfil()
    }
}

struct TabButtonProfile: View {
    
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    @Binding var selectedTab: ViewButtonProfile
    var buttonName: ViewButtonProfile
    
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



