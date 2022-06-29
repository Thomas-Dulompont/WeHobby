//
//  SearchBarView.swift
//  WeHubbyTests
//
//  Created by apprenant66 on 22/06/2022.
//

import SwiftUI

struct SearchBarView: View {
    @State var search : String = ""
    var body: some View {
    
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.24))
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(.systemGray))
                    TextField("Recherche", text: $search)
                    Spacer()
                    Image(systemName: "mic.fill")
                        .foregroundColor(Color(.systemGray))
                }
                .padding(.horizontal)
            }
            .frame(width: 358, height: 36)
        }
    }


struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
