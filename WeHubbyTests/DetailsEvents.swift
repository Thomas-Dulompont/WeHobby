//
//  DetailsEvents.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import SwiftUI

struct DetailsEvents: View {
    
    var width: CGFloat = UIScreen.main.bounds.width - 50
    
    var event : Events
    
    @State var buttonName: String = "Participer"

    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                Image(event.eventPicture)
                    .resizable()
                    .scaledToFit()
                    .frame(width:width)
                    .cornerRadius(24)
                    .shadow(radius: 4)
                    .padding(.bottom, 15)
                
                HStack(spacing:14) {
                    
                    VStack(spacing: 4) {
                        
                        Text(event.eventName)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                        HStack(spacing: 16){
                            Text("📍 \(event.eventPlace)")
                                .fontWeight(.thin)
                            
                            Text("📅 \(event.eventDate)")
                                .fontWeight(.thin)
                        }
                    }
                    
                    
                    Button {
                        if buttonName == "Participer" {
                            
                        buttonName = "Participe "
                        } else {
                            
                        buttonName = "Participer"
                        }
                        
                        
                    } label: {
                        Text(buttonName)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical,16)
                            .background(Color.accentColor)
                            .cornerRadius(28)
                            .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                    }
                }
                .padding(.bottom)
                Divider().frame(width: width)
                    .padding(.bottom,8)
                
                VStack(spacing: 16){
                    
                    Text(event.eventDesc)
                        .font(.system(size:16))
                        .padding()
                    
                    
                    
                    
                    HStack {
                        
                        Text("Participants (\(event.participants.count))")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                            .underline()
                            .frame(alignment: .leading)
                    }
                    .padding(.trailing,220)
                    ScrollView(.horizontal, showsIndicators: false) {

                    HStack(spacing: -30){
                        ForEach(event.participants) { participant in
                            
                            Image(participant.userPicture)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80)
                                .clipped()
                                .clipShape(Circle())
                                .shadow(radius: 5)
                                .padding(4)
                                .background(Color.white)
                                .clipShape(Circle())
                                
                            
                        }
                        }
                        
                        
                    }
                    .padding(.bottom,10)
                    .padding(.leading,15)
                    
                    HStack {
                        
                        Text("Commentaires (\(event.comms.count))")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                            .underline()
                            .frame(alignment: .leading)
                    }
                    .padding(.trailing,200)
                }
            }
            
                
            
        }
    }
}

struct DetailsEvents_Previews: PreviewProvider {
    static var previews: some View {
        DetailsEvents(event: evenements[0])
    }
}
