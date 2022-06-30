//
//  TutosDetailRaw.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//

import SwiftUI

struct TutosDetailRaw: View {
    
    var listTutos: Tutos
    
    var body: some View {

        HStack {
            Image(listTutos.tutoImage)
                .resizable()
                .frame(width: 130.0, height: 100.0)
                .scaledToFit()
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
            
            VStack(alignment: .leading){
                Text(listTutos.tutoTitle)
                    .font(.body)
                Text(listTutos.creator)
                    .font(.callout)
                    .fontWeight(.thin)
            }
        Spacer()
            
        }
        }
        }


struct TutosDetailRaw_Previews: PreviewProvider {
    static var previews: some View {
        TutosDetailRaw(listTutos: listTutos[0])
    }
}
