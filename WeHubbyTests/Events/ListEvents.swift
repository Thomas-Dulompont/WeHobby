//
//  ListEvents.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import SwiftUI

struct ListEvents: View {
    
    var width: CGFloat = UIScreen.main.bounds.width - 50

    var event : [Events]
    
    var body: some View {
        
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                
            ForEach(event) { eventlist in
                
               
                    
                VStack(spacing: 24){
                    Image(eventlist.eventPicture)
                        .resizable()
                        .scaledToFit()
                        .frame(width:width)
                        .cornerRadius(24)
                        .shadow(radius: 4)
                    
                    HStack(spacing:30) {
                        VStack(spacing: 4) {
                            
                            Text(eventlist.eventName)
                                .fontWeight(.semibold)
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                            HStack(spacing: 16){
                            Text("📍 \(eventlist.eventPlace)")
                                    .fontWeight(.thin)
                                    .foregroundColor(.black)

                                 
                            Text("📅 \(eventlist.eventDate)")
                                .fontWeight(.thin)
                                .foregroundColor(.black)

                            }
                        }
                        
                        NavigationLink(destination: {
                            DetailsEvents(event: eventlist)
                        }, label: {
                            Text("Voir")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical,16)
                                .background(Color("CustomColorGreen"))
                                .cornerRadius(28)
                                .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                        })
                    }
                    Divider().frame(width: width)
                        .padding(.bottom,20)
                }
            
            }
            }
                               
        }
        
        
    }
}

struct ListEvents_Previews: PreviewProvider {
    static var previews: some View {
        ListEvents(event: evenements)
    }
}
