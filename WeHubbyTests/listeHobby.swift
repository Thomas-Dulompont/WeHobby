//
//  listeHobby.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 20/06/2022.
//

import SwiftUI

struct listeHobby: View {
    var body: some View {
        
        
        List(loisirs) { item in
            HStack{
            Image(item.hobbyPic)
                .resizable()
                .scaledToFill()
                .frame(width:70, height: 70)
                .clipped()
                .cornerRadius(8)
            
            Text(item.hobbyName)
                .fontWeight(.medium)
                .font(.system(size: 20))
        }
        }
    }
}

struct listeHobby_Previews: PreviewProvider {
    static var previews: some View {
        listeHobby()
    }
}
