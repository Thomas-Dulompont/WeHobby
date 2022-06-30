//
//  ShowEventonMap.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 20/06/2022.
//

import SwiftUI

struct ShowEventonMap: View {
    
    var evenement: [Events]
    
    var width: CGFloat = UIScreen.main.bounds.width - 50
    
    let radius: CGFloat = 16
    
    @Binding var selectedEvent : Int
    
    var body: some View {
        
        // Creation de la scroll Event sur la Map sous forme de TabView
        
        TabView(selection: $selectedEvent) {
            //            HStack(alignment: .center, spacing: 24) {
            ForEach(0..<evenement.count) { index in
                
                // on utilise les index pour lier à la map, les filtres et les span
                let event = evenement[index]
                
                ZStack {
                    
                
                VStack(alignment: .center, spacing:0) {
                    Image(event.eventPicture)
                        .resizable()
                        .scaledToFill()
                        .frame(width : width, height: 90)
                        .clipped()
                    
                    ZStack {
                        Rectangle()
                            .frame(width: width, height: 80)
                            .foregroundColor(Color("whitty"))
                            .opacity(0.5)
                        
                        HStack{
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
                            
                            // Button pour voir le détail de l'evenement
                            
                            NavigationLink {
                                DetailsEvents(event: event)
                            } label: {
                                Text("Voir")
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
                        .padding(.bottom,2)
                        
                        //                    Image(systemName: "chevron.right.circle.fill")
                        //                        .font(.system(size: 36))
                        //                        .foregroundColor(.gray)
                        //                        .opacity(0.7)
                        //                        .offset(x: 160, y: -44)
                        
                        // Button pour fermer la tabview grace à l'index
                        
                        Button {
                            selectedEvent = 999
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .opacity(1)
                            
                        }.offset(x: 140, y: -110)
                        
                    }
                }   .cornerRadius(16)
                    .padding(2)
                    .background(Color("whitty"))
                    .opacity(0.85)
                    .cornerRadius(16)
                    .tag(index)
                    
                }
                
            }
            
            //            }            .padding(.leading)
            //                    .onChange(of: selectedEvent) { newValue in
            //
            //                        withAnimation {
            //                        proxy.scrollTo(selectedEvent.id, anchor: .center)
            //                        }
            //                    }
            
            
        } .tabViewStyle(.page(indexDisplayMode: .always))
            .frame(height: 250)
        
            .offset(y: -230)
        
    }
}

struct ShowEventonMap_Previews: PreviewProvider {
    static var previews: some View {
        ShowEventonMap(evenement: evenements, selectedEvent: .constant(0))
    }
}
