//
//  PicutresHobbies.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 03/07/2022.
//

import SwiftUI

struct PicutresHobbies: View {
    
    var couturePhotos : [String] = ["couture", "enfant", "femmeatelier", "femmemac", "fil", "image12", "image17", "image18", "maincouture", "materiel", "metre", "pointdecroix", "tricot", "tricotevent", "coutureswipe"]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {

        
        LazyVGrid(columns: columns, alignment: .center, spacing: 4) {
            ForEach(couturePhotos, id: \.self) { pictures in
                
                Image(pictures)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 130)
                    .clipped()
            }
        
        }
    }
}

struct PicutresHobbies_Previews: PreviewProvider {
    static var previews: some View {
        PicutresHobbies()
    }
}
