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
            ForEach(listTutos) { tutos in
                TutosDetailRaw(tutos: tutos)
            }
        }
    }
}

struct ListeContentTutosDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListeTutosDetail(listTutos: listTutos)
    }
}
