//
//  SwiftUIView.swift
//  WeHubbyTests
//
//  Created by apprenant66 on 21/06/2022.
//

import SwiftUI

struct AmisView: View {
    
    @State var searchText : String
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            Text("Mes Amis")
                .font(.title)
                .foregroundColor(.accentColor)
                .fontWeight(.bold)
                .padding(15)
            
            Divider()
            
            SearchBarView()
            
            HStack {
                Text("Amis en ligne")
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                    .padding(15)
                Spacer()
            }
            ScrollView(.horizontal){
//                if searchText.isEmpty {
                    HStack{
                        ForEach(userProfiles) { profil in
                            
                            DetailsBulleMessage(friend: profil)
                            
                        }
                    }.padding(.leading)
                    
//                } else {
//                    HStack{
//                        ForEach(userProfiles) { profil in
//
//                            DetailsBulleMessage(friend: profil)
//                        }
//                    }
//            }
            
           
            
        }
            HStack {
                Text("Conversations")
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                    .padding(15)
                Spacer()
            }
            ForEach(userProfiles) { profil1 in
                
                DetailListMessage(friend: profil1)
                
                Divider()
            }
            Spacer()
        
        }
        
        
    }
    
    
    
    
    
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AmisView(searchText: "alllo")
    }
}
