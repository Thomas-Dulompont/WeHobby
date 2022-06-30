//
//  FutursEventsProfil.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 30/06/2022.
//

import SwiftUI

struct FutursEventsProfil: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack{
            //Spacer()
            ScrollView(.vertical, showsIndicators: false){
                ZStack {
                    
                    LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                        
                        ForEach(evenements) { event in
                            
                            if event.participate == true {
                                
                                VStack {
                                    
                                    Image(event.eventPicture)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 175, height:175)
                                        .clipped()
                                    
                                    Text(event.eventName)
                                        .fontWeight(.thin)
                                        
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
}

struct FutursEventsProfil_Previews: PreviewProvider {
    static var previews: some View {
        FutursEventsProfil()
    }
}
