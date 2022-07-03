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

        HStack(spacing: 20) {
            Image(listTutos.tutoImage)
                .resizable()
                .scaledToFill()
                .frame(width: 130.0, height: 100.0)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
            
            VStack(alignment: .leading, spacing: 8){
                Text(listTutos.tutoTitle)
                    .font(.body)
                
                Text(listTutos.creator)
                    .font(.callout)
                    .fontWeight(.thin)
                    .italic()
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
