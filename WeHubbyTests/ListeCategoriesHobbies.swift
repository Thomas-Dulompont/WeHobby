//
//  ListeCategoriesHobbies.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 21/06/2022.
//

import SwiftUI

struct ListeCategoriesHobbies: View {
    var body: some View {
        NavigationView {
        VStack {
            
            List(categoris) { hobby in
                NavigationLink(destination: {
                    listeHobby(hobby: hobby)
                }, label: {
                HStack{
                    
                Image(hobby.picCategory)
                    .resizable()
                    .scaledToFit()
                    .frame(width:70)
                    
                
                    Text(hobby.nameCategory.rawValue)
                        .fontWeight(.medium)
                        .font(.system(size: 20))
                    
                }

                })

            }
            }
        .navigationBarHidden(true)
    }
}
}
struct ListeCategoriesHobbies_Previews: PreviewProvider {
    static var previews: some View {
        ListeCategoriesHobbies()
    }
}
