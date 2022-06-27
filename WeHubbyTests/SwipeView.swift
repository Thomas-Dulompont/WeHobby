//
//  SwipeView.swift
//  WeHubbyTests
//
//  Created by Apprenant 47 on 22/06/2022.
//

import SwiftUI

struct SwipeView: View {
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(loisirs) { loisir in
                    SwipeCardView(loisirs: loisir)
                }
                Text("Test")
            }
        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
