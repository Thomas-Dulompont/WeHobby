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
        
        NavigationView {
        VStack(alignment: .center, spacing: 0) {
            Text("Mes Amis")
                .font(.title)
                .foregroundColor(.accentColor)
                .fontWeight(.bold)
//                .padding(15)
            
            Divider()
            
            SearchBarView()
            
            HStack {
                Text("Mes Amis")
                    .font(.system(size: 18))
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                    .underline()
                    .padding(10)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false){
                //                if searchText.isEmpty {
                HStack{
                    
                    ForEach(userProfiles) { profil in
                        
                        NavigationLink(destination: {
                            ProfilAmis(friend: profil)
                        }, label: {
                            DetailsBulleMessage(friend: profil)
                        })
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
                    .font(.system(size:18))
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                    .underline()
                    .padding(10)
                Spacer()
            }
            ScrollView(.vertical, showsIndicators: false) {
            ForEach(userProfiles) { profil1 in
                NavigationLink(destination: {
                    MessageView(friend: profil1)
                }, label: {
                DetailListMessage(friend: profil1)
                })
                Divider()
                    
            }
            Spacer()
            }
        }
        
               .navigationBarHidden(true)
    }
    
    
    }
    
    
    
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AmisView(searchText: "alllo")
    }
}
