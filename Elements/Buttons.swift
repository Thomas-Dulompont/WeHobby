//
//  Buttons.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        
        VStack(spacing:50) {
            
            
            HStack(spacing: 70){
                Button {
                    
                } label : {
                    Image(systemName: "person.badge.plus.fill")
                        .font(.system(size:32))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                }
                
                
                
                Button {
                    
                } label : {
                    Image(systemName: "ellipsis.bubble.fill")
                        .font(.system(size:32))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                }
            }
            
            HStack(spacing: 50){

                Button {
                    
                } label : {
                    Image(systemName: "gearshape.2.fill")
                        .font(.system(size:32))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                }
                
                Button {
                    
                } label : {
                    Image(systemName: "camera.fill")
                        .font(.system(size:24))
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                }
                
                Button {
                    
                } label : {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size:24))
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                }

            }
            
            Button {
                
            } label: {
                Text("Participer")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical,16)
                    .background(Color.accentColor)
                    .cornerRadius(28)
                    .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
            }
            
            Button {
                
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
            
            Button {
                
            } label: {
                Text("Valider")
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
    }
}
struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
