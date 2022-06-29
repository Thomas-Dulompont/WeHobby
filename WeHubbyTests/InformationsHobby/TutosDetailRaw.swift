//
//  TutosDetailRaw.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//

import SwiftUI

struct TutosDetailRaw: View {
    var tutos : Tutos
    var body: some View {

        HStack {
            Image(tutos.tutoImage)
                .resizable()
                .frame(width: 130.0, height: 100.0)
                .scaledToFit()
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 3)
            
            VStack(alignment: .leading){
                Text(tutos.tutoTitle)
                    .font(.body)
                Text(tutos.creator)
                    .font(.callout)
                    .fontWeight(.thin)
            }
        Spacer()
            
        }
        }
        }


struct TutosDetailRaw_Previews: PreviewProvider {
    static var previews: some View {
        HobbyView(loisirs:loisirs[0])
    }
}
