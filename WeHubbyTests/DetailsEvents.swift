//
//  DetailsEvents.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import SwiftUI

struct DetailsEvents: View {
    
    var width: CGFloat = UIScreen.main.bounds.width
    
    @ObservedObject var event : Events
    
    @State var buttonParticipe: String = "xmark"
    
    @State var buttonImage: String = "heart"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                
                ZStack {
                    Image(event.eventPicture)
                        .resizable()
                        .scaledToFill()
                        .frame(width:width, height: 250)
                        .clipped()
                    //                    .cornerRadius(24)
                        .shadow(radius: 4)
                        .ignoresSafeArea()
                        .padding(.bottom, 15)
                    
                    HStack {
                        
                        Spacer()
                        Button {
                            
                        } label: {
                            
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                        }.padding(10)
                            .background(
                                Capsule()
                                    .fill(Color.accentColor))
                            .opacity(0.9)
                            .cornerRadius(16)
                            .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                        
                    }.padding(.trailing, 24)
                        .padding(.bottom, 190)
                }
                
                HStack(spacing:14) {
                    VStack(spacing: 4) {
                        Text(event.eventName)
                            .fontWeight(.semibold)
                            .font(.system(size: 28))
                        HStack(spacing: 16){
                            Text("📍 \(event.eventPlace)")
                                .fontWeight(.thin)
                                .font(.system(size: 16))
                            
                            Text("📅 \(event.eventDate)")
                                .fontWeight(.thin)
                                .font(.system(size: 16))
                        }
                    }
                    
                }
                
                HStack(spacing: 20) {
                    
                    Button {
                        event.participate.toggle()
                    } label: {
                        HStack {
                            withAnimation{
                                Image(systemName: event.participate ? "checkmark" : "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                            Text(event.participate ? "Participe" : "Participer")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                        }.padding(.horizontal, 12)
                            .padding(.vertical,10)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(Color.accentColor)
                            )
                        //                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                    }
                    
                    
                    
                    Button {
                        
                        withAnimation{
                            if buttonImage == "heart" {
                                
                                buttonImage = "heart.fill"
                            } else {
                                
                                buttonImage = "heart"
                            }
                        }
                        
                    } label: {
                        
                        HStack {
                            
                            Image(systemName: buttonImage)
                                .foregroundColor(.accentColor)
                                .font(.system(size: 20))
                            
                            Text("Intéressé(e)")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                            
                        }.padding(.horizontal, 12)
                            .padding(.vertical,10)
                            .background(
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .stroke(Color.accentColor, lineWidth: 1.5)
                            )
                    }
                    
                }
                Divider().frame(width: width)
                    .padding()
                
                VStack(spacing: 16){
                    
                    Text(event.eventDesc)
                        .font(.system(size:16))
                        .padding(.horizontal, 20)
                    
                    
                    HStack {
                        
                        Text("Informations pratiques")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                            .frame(alignment: .leading)
                    }
                    .padding(.trailing,155)
                    
                    
                    HStack {
                        
                        if event.type == .isOut || event.type == .isIn {
                            
                            Image(systemName: "mappin.circle.fill")
                                .font(.system(size: 32))
                            
                        } else {
                            
                            Image(systemName: "network")
                                .font(.system(size: 32))
                        }
                        
                        Text(event.lieuComplet)
                            .fontWeight(.light)
                            .italic()
                        
                    }
                    .frame(width: 320)
                    
                    HStack {
                        
                        Text("Participants (\(event.participants.count))")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                            .frame(alignment: .leading)
                    }
                    .padding(.trailing,220)
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: -30){
                            ForEach(event.participants) { participant in
                                
                                Image(participant.userPicture)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70)
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
