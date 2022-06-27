//
//  ListeCategorie.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 18/06/2022.
//

import SwiftUI

struct ListeCategorie: View {
    var body: some View {
        
//        NavigationView {
        VStack {
            
            List(categoris) { hobbi in
                NavigationLink(destination: {
                    ListEvents(event: filterEventsCategories(categorie: hobbi))
                }, label: {
                HStack{
                    
                Image(hobbi.picCategory)
                    .resizable()
                    .scaledToFit()
                    .frame(width:70)
                    
                
                    Text(hobbi.nameCategory.rawValue)
                        .fontWeight(.medium)
                        .font(.system(size: 20))
                    
                }

                })

            }
            }
//        }.navigationBarHidden(true)
    }
}

struct ListeCategorie_Previews: PreviewProvider {
    static var previews: some View {
        ListeCategorie()
    }
}
