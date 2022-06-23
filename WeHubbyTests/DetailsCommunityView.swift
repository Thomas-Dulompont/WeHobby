//
//  DetailsCommunityView.swift
//  WeHubbyTests
//
//  Created by Apprenant 47 on 23/06/2022.
//

import SwiftUI

struct DetailsCommunityView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title Exemple")
            ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(evenements) { event in
                            ListCommunityEvents(events: event)
                        }
                    }.padding()
            }
        }
        }
    }

struct DetailsCommunityView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCommunityView()
    }
}

struct ListCommunityEvents: View {
    var events: Events
    
    var body: some View {
        VStack{
            Image(events.eventPicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120, alignment: .center)
                .clipped()
                .cornerRadius(30)
            Text(events.eventName)
                .font(.subheadline)
                .bold()
                .multilineTextAlignment(.center)
            Text(events.eventPlace)
                .foregroundColor(Color("CustomColorGreen"))
                .bold()
        }
    }
}
