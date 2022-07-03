//
//  ListeTutosDetailView.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//

import SwiftUI

struct ListeTutosDetail: View {
    
    var listTutos: [Tutos]
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 20){
            ForEach(listTutos) { listTuto in
                TutosDetailRaw(listTutos: listTuto)
                Divider().frame(width: 280)
            }
            .padding(.horizontal)
            }
        }
    }
}

struct ListeContentTutosDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListeTutosDetail(listTutos: listTutos)
    }
}
