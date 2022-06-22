//
//  ContentView.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SwipeView()
                .tabItem {
                    Label("Loisirs", systemImage: "dice.fill")
                }
            
            MapView()
                .tabItem {
                    Label("Évènements", systemImage: "theatermasks.fill")
                }
            Text("Amis")
                .tabItem {
                    Label("Amis", systemImage: "person.2.fill")
                }
            ProfilAmis()
                .tabItem {
                    Label("Mon profil", systemImage: "person.circle.fill")
                }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
