//
//  listeHobby.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 20/06/2022.
//

import SwiftUI

struct listeHobby: View {
    
    var hobby : [Hobbies]
    
    var body: some View {
        
        
        // Liste des loisirs, filtrés grâce à la func dans la navigationlink
        VStack {
            
            
            List(hobby) { hobb in
            HStack{
            Image(hobb.hobbyPic)
                .resizable()
                .scaledToFill()
                .frame(width:60, height: 60)
                .clipped()
                .cornerRadius(24)
                .shadow(radius: 5)
                
                Text(hobb.hobbyName)
                    .fontWeight(.medium)
                    .font(.system(size: 20))
            
        }
        }
        }
        
    }
}

struct listeHobby_Previews: PreviewProvider {
    static var previews: some View {
        listeHobby(hobby: loisirs)
    }
}


