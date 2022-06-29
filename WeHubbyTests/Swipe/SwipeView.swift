//
//  SwipeView.swift
//  WeHubbyTests
//
//  Created by Apprenant 47 on 22/06/2022.
//

import SwiftUI

struct SwipeView: View {
    @State var selectedTab: ViewButtonEvent = .map

    @State var currentTab = "Découverte"
    
    @State var tabBarOffset: CGFloat = 0

    @Namespace var animation
    
    var body: some View {
        NavigationView {
        VStack(spacing: 0){
                HStack{
                    TabButtonEvent(title: "Découverte", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .map)
                    Spacer()
                    TabButtonEvent(title: "Afficher la Liste", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .list)
                }
            
            VStack {
                switch selectedTab {
                case .map:
                    ZStack {
                        ForEach(loisirs) { loisir in
                            SwipeCardView(loisirs: loisir)
                        }
                    }
                            
                case .list:
                    ListeCategoriesHobbies()
                }
            }
        }
        .navigationBarHidden(true)
        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
