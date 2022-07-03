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
    
    @State var currentTab = "Photos"
    
    @State var tabBarOffset: CGFloat = 0
    
    @Namespace var animation
    
    @State var imageName: String = "person.fill.badge.plus"

    var friend: Friends
    
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        
            
            ZStack{
                
                VStack {
                    HStack{
                        
                    
                    
                    Button{
                                           dismiss()
                                        } label: {
                                            Image(systemName: "chevron.left")
                                                .font(.system(size: 30))
                                                .padding(10)
                                                .background{
                                                          Circle()
                                                            .fill(.ultraThinMaterial)
                                                    }
                                            
                                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.leading, 6)
                .zIndex(1)
                
                VStack {
                Image(friend.userCover)
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
                        Button {
                            
                            
                            
                        } label : {
                            Image(systemName: friend.isFriend == true ? "person.fill.badge.minus" : "person.fill.badge.plus")
                                .font(.system(size:32))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.accentColor)
                                .clipShape(Circle())
                                .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                        }
                        .padding(.leading, 20)
                        
                        
                        Image(friend.userPicture)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .shadow(color: .accentColor, radius: 6)
                            .padding(4)
                            .background(Color.accentColor)
                            .clipShape(Circle())
                            .offset(y: -25)
                        
                        
                        
                        NavigationLink {
                            MessageView(user: friend)

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
                        Text(friend.userPsedo)
                            .font(.title)
                            .fontWeight(.medium)
                        
                        HStack {
                            
                            Image(systemName : "mappin.and.ellipse")
                                .foregroundColor(.accentColor)
                                .font(.callout)

                            Text(friend.ville)
                                .foregroundColor(.accentColor)
                                .font(.callout)
                            
                            
                            
                            Spacer()
                        }
                        .padding(.leading, 30)
                        
                        HStack(spacing: 10){
                            
                            
                                
                            Text(friend.userTag[0].rawValue.uppercased())
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 5.0)
                                    .padding(.horizontal, 10.0)
                                    .background(Color("CustomColorBlue"))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            
                            Text(friend.userTag[1].rawValue.uppercased())
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 5.0)
                                    .padding(.horizontal, 10.0)
                                    .background(Color("CustomColorBlue"))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            
                            Text(friend.userTag[2].rawValue.uppercased())
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 5.0)
                                    .padding(.horizontal, 10.0)
                                    .background(Color("CustomColorBlue"))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            
                            }
                        
                        
                        Text(friend.userBio)
                            .font(.system(size:16))
                            .frame(height: 70)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        
                        HStack{
                            Text("Loisirs favoris")
                                .foregroundColor(.accentColor)
                                .fontWeight(.bold)
                                .frame(alignment: .leading)
                                .padding(.leading,15)
                            
                            Spacer()
                        }
                        
                        HStack(spacing: 20){
                            
                            ForEach(friend.favoriteCategory) { favoris in
                                
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
                                    
                                    TabButtonBis(title: "Photos", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .photos)
                                    
                                    TabButtonBis(title: "Évènements futurs", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .futurs)
                                    
                                    TabButtonBis(title: "Évènements organisés", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .past)
                                    
                                    
                                }
                                
                            }
                            
                            
                            Divider()
                            VStack {
                                switch selectedTab {
                                case .photos :
                                    
                                    PicturesFriends(user: friend)
                                case .futurs:

                                    FutursEventsProfil()
                                    
                                case .past :

                                    EventOrganinizer()
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
//        VStack {
//            Spacer()
//        HStack {
//
//            Spacer()
//    Button {
//
//    } label : {
//        Image(systemName: "camera.fill")
//            .font(.system(size:24))
//            .foregroundColor(.white)
//            .padding(12)
//            .background(Color.accentColor)
//            .clipShape(Circle())
//            .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
//
//    }
//    .padding(.trailing, 15)
//    .padding(.bottom, 15)
//        }
//        }
    }
            .navigationBarHidden(true)
}
}

struct ProfilAmis_Previews: PreviewProvider {
    static var previews: some View {
        ProfilAmis(friend: userProfiles[4])
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


