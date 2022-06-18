//
//  test.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import SwiftUI

struct test: View {
    var width: CGFloat = UIScreen.main.bounds.width
        var heigth: CGFloat = UIScreen.main.bounds.height
        @State var selectedTab: ViewButton = .decouvrir

        @State var currentTab = "Découvrir"

        @State var tabBarOffset: CGFloat = 0
        
        @Namespace var animation

        var body: some View {
            if let user = userProfiles.first(where: { $0.isCurrentUser
            }){
                
                VStack (){
                    Image(user.userCover)
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: 250)
                        .ignoresSafeArea()
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .offset(y: -80)
                        .frame(height: 100)
                    VStack{
                    HStack(spacing: 30){
                        Button {
                            
                        } label : {
                            Image(systemName: "person.badge.plus.fill")
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
                        HStack(spacing: 25){
                            Text(user.userTag[0].rawValue)
                            .fontWeight(.semibold)
                            .padding(.vertical, 5.0)
                            .padding(.horizontal, 10.0)
                            .background(.cyan)
                            .foregroundColor(.white)
                        .cornerRadius(10)
                        }
                    Text(user.userBio)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .frame(height:70)
                    Spacer()
                    HStack{
                        Text("Loisirs favoris")
                            .fontWeight(.semibold)
                            .padding(.leading, 25.0)
                            .foregroundColor(.accentColor)
                        Spacer()
                    }
                        HStack(spacing: 25){
                            
                            Image(user.favoriteCategory[0].picCategory)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Spacer()
                        }
                        .padding(.leading)
                        VStack(spacing: 0){
                            ScrollView(.horizontal,showsIndicators: false) {
                                
                                HStack(spacing: 20){
                                    
                                    TabButton(title: "Photos", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .communaute)
                                    
                                    TabButton(title: "Évènements futurs", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .galerie)
                                    
                                    TabButton(title: "Évènements passés", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .galerie)

                                    
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
struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
