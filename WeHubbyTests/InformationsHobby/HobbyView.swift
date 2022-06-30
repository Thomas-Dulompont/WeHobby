//
//  HobbyView.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//

import SwiftUI

struct HobbyView: View {
    @State var selectedTab: ViewButtonEvent = .map

    @State var currentTab = "Découvrir"
    
    @State var tabBarOffset: CGFloat = 0

    @Namespace var animation
   
    var loisirs: Hobbies
    var listTutos: [Tutos]
    
    var body: some View {
        NavigationView {
        VStack(spacing: 0){
                HStack{
                    TabButtonEvent(title: "Découvrir", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .map)
                    Spacer()
                    TabButtonEvent(title: "Communauté", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .list)
                }
            
            VStack {
                switch selectedTab {
                case .map:
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
                                    .frame(width: 375)
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
                            
                case .list:
                    //AJOUTER VIEW POUR HOBBY EVENT
                    ListEvents(event: evenements)
                }
            }
        }
        .navigationBarHidden(true)
        }
    }
}

struct HobbyView_Previews: PreviewProvider {
    static var previews: some View {
        HobbyView(loisirs:loisirs[0], listTutos: listTutos)
    }
}
