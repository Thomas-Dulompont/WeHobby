//
//  HobbyView.swift
//  WeHubbyTests
//
//  Created by apprenant58 on 24/06/2022.
//

import SwiftUI

struct HobbyView: View {
    
    var tutosDetail: TutosDetail
    var images: String
   
    var body: some View {
        
    VStack {

        VStack (alignment: .leading){
            Text(tutosDetail.tutoTitle)
                .font(.title)
                NavigationLink  {
                    HobbyDetailView(tutosDetail: tutosDetail)
                } label: {
                    Image(tutosDetail.tutoImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 240)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
                        .shadow(radius: 3)
                }
            Text(tutosDetail.tutoSubtitle)
                .font(.body)
            }
            
            HStack (alignment: .top) {
            Image(tutosDetail.creatorAvatar)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 30.0, alignment: .leading)
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 3)
                Text(tutosDetail.creator)
                Spacer()
                Text(tutosDetail.tutoDuration)
                        .font(.callout)
                        .fontWeight(.thin)
                        .multilineTextAlignment(.leading)
                }
            .padding (.bottom, 40.0)
        
ListeTutosDetail(listTutos: tutosDetail.tutos)
            }
            .padding()
        }
        }

struct HobbyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        HobbyView(tutosDetail: listTutosDetail[2], images: "instabroderie")
        }
    }
}
