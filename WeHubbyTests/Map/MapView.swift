//
//  MapView.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 18/06/2022.
//

import SwiftUI
import MapKit

enum ViewButtonEvent {
    case map
    case list
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

let locations = [
    Location(name: "Condition publique", coordinate: CLLocationCoordinate2D(latitude: 50.690738, longitude: 3.189492)),
    Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
]
struct MapView: View {
    
    @State var selectedTab: ViewButtonEvent = .map

    @State var currentTab = "Afficher la carte"
    
    @State var tabBarOffset: CGFloat = 0

    @Namespace var animation
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.6927049, longitude: 3.177847), span: MKCoordinateSpan(latitudeDelta: 50.6927049, longitudeDelta: 3.177847))


    var body: some View {

        NavigationView {

        VStack(spacing: 0){
            ScrollView(.horizontal,showsIndicators: false) {
                
                HStack(spacing: 20){
                    
                    TabButtonEvent(title: "Afficher la carte", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .map)
                    
                    TabButtonEvent(title: "Afficher par catégorie", currentTab: $currentTab, animation: animation, selectedTab: $selectedTab, buttonName: .list)
                    
                    
                }
                
                
            }
//            Spacer()
            
            VStack {
                switch selectedTab {
                case .map:

                   OnlyMapView()
                            
                case .list:
                    ListeCategorie()
                }
                
            }
            
//            Divider()
        }        .navigationBarHidden(true)

        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

struct TabButtonEvent: View {
    
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    @Binding var selectedTab: ViewButtonEvent
    var buttonName: ViewButtonEvent
    
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


