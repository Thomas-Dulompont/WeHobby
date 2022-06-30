//
//  EventOrganinizer.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 30/06/2022.
//

import SwiftUI

struct EventOrganinizer: View {
    var body: some View {
        
        
        HStack {
            
            VStack {
            Image(evenements[2].eventPicture)
                .resizable()
                .scaledToFill()
                .frame(width: 175, height: 175)
                .clipped()
            
            Text(evenements[2].eventName)
                .fontWeight(.thin)
            }
            
            VStack {
            Image(evenements[5].eventPicture)
                .resizable()
                .scaledToFill()
                .frame(width: 175, height: 175)
                .clipped()
            
            Text(evenements[5].eventName)
                .fontWeight(.thin)
            }
            
        }
    }
}

struct EventOrganinizer_Previews: PreviewProvider {
    static var previews: some View {
        EventOrganinizer()
    }
}
