//
//  Picker.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import SwiftUI


enum ViewButton {
    case decouvrir
    case communaute
    case galerie
}

struct Picker: View {
    
    @State var selectedTab: ViewButton = .decouvrir

    @State var currentTab = "Découvrir"

    @State var tabBarOffset: CGFloat = 0
    
    @Namespace var animation


    var body: some View {
        
        
        VStack(spacing: 0){
            ScrollView(.horizontal,showsIndicators: false) {
                
                HStack(spacing: 20){
                    
                    TabButton(title: "Découvrir", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .decouvrir)
                    
                    TabButton(title: "Galerie", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .communaute)
                    
                    TabButton(title: "Communauté", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .galerie)

                    
                }
                
            }
            
            
            Divider()
        }
        
        
        .padding(.top,10)
        .background(Color.white)
        .offset(y: tabBarOffset < 90 ? -tabBarOffset + 90 : 0)
        .overlay(
            
            GeometryReader { reader -> Color in
                
                let minY = reader.frame(in: .global).minY
                
                
                DispatchQueue.main.async {
                    
                    self.tabBarOffset = minY
                }
                
                return Color.clear
                
            }
            
                .frame(width: 0, height: 0)
            
            
            ,alignment: .top
        )
        .zIndex(1)
        
        VStack {
            switch selectedTab {
            case .decouvrir:
                Buttons()
                    .padding(.bottom,5)
            case .communaute:
                ContentView()
            case .galerie:
                Text("ok")
                
            }
            
        }
        .padding(.top)
        .zIndex(0)
    }
}

struct Picker_Previews: PreviewProvider {
    static var previews: some View {
        Picker()
    }
}

struct TabButton: View {
    
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    @Binding var selectedTab: ViewButton
    var buttonName: ViewButton
    
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


