//
//  EditMypROFILE.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 28/06/2022.
//

import SwiftUI

struct EditMypROFILE: View {
    
    var width: CGFloat = UIScreen.main.bounds.width
    var heigth: CGFloat = UIScreen.main.bounds.height
    
    var user = userProfiles[0]
    @State var psedo: String = userProfiles[0].userPsedo
    
    @State var city: String = userProfiles[0].ville
    
    @State var bio: String = userProfiles[0].userBio
    
    @Environment(\.dismiss) var dismiss
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init() {
            UITextView.appearance().backgroundColor = .clear
        }
    
    var body: some View {

        if let user = userProfiles.first(where: { $0.isCurrentUser
        }){
            
            ZStack{
                
                VStack {
                    HStack{
                        
                    
                    
                    Button{
                                           dismiss()
                                        } label: {
                                            Image(systemName: "chevron.left")
                                                .font(.system(size: 30))
                                                .padding(10)
                                                .background{
                                                          Circle()
                                                            .fill(.ultraThinMaterial)
                                                    }
                                            
                                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.leading, 6)
                .zIndex(1)
                
                Image(systemName: "square.and.pencil")
                
                VStack {
                Image(user.userCover)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: 300)
                    .blur(radius:2)
                    .clipped()
                    .ignoresSafeArea()
                    .zIndex(0)
                    
                    
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        
                    Spacer()
                Image(systemName: "square.and.pencil")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding(10)
                            .background{
                                      Circle()
                                        .fill(.ultraThinMaterial)
                                }
                
                    }
                    Spacer()
                }
                .padding(.trailing,10)
                
                ZStack {
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        VStack(spacing: 10){
                                
                            HStack(spacing: 30){
                            ZStack{
                                Image(user.userPicture)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                                    .shadow(color: .accentColor, radius: 6)
                                    .padding(4)
                                    .background(Color.accentColor)
                                    .clipShape(Circle())
                                    .offset(y: -25)
                                
                                    Image(systemName: "camera.shutter.button")
                                        .font(.system(size: 70))
                                        .foregroundColor(.white)
                                        .padding(16)
                                        .background{
                                              Circle()
                                                .fill(.ultraThinMaterial)
                                            }
                                        .offset(y: -25)
                                        
                                        
                                }
                                Button {                                    
                                    dismiss()
                                } label : {
                                    Image(systemName: "checkmark")
                                        .font(.system(size:32))
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.accentColor)
                                        .clipShape(Circle())
                                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                                }
                                .padding(.trailing, 20)
                            }
                            .offset(x: 58)

                                
                                
                            Spacer().frame(height:20)
                            
                            
                            
                            VStack(alignment: .leading, spacing: 20){
                                
                                HStack {
                                    
                                Text("Pseudo")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.accentColor)
                                    
                                    Spacer()
                                    
                                    TextEditor(text: $psedo)
                                        .font(.system(size: 17))
                                        .padding(.leading)
                                        .background(Color("lightgray"))
                                        .frame(width: 200, height:40)
                                        .cornerRadius(24)
                                    
                                }
                                .padding(.horizontal, 20)
                                
                                HStack {
                                    
                                    Text("Ville")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.accentColor)
                                    
                                    Spacer()
                                    
                                   

                                    TextEditor(text: $city)
                                        .font(.system(size: 17))
                                        .padding(.leading)
                                        .background(Color("lightgray"))
                                        .frame(width: 200, height:40)
                                        .cornerRadius(24)
                                    
                                }
                                .padding(.horizontal, 20)
                                
                                HStack(spacing: 10){
                                    
                                    
                                    Text("Centres d'intérêts")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.accentColor)
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                  
                                    LazyVGrid(columns: columns, alignment: .leading) {
                                    ForEach(user.userTag, id: \.self) { tags in
                                        
                                        
                                        Text(tags.rawValue)
                                        .fontWeight(.semibold)
                                        .padding(.vertical, 5.0)
                                        .padding(.horizontal, 10.0)
                                        .background(.cyan)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                
                                    }
                                        Text("+")
                                        .fontWeight(.semibold)
                                        .padding(.vertical, 5.0)
                                        .padding(.horizontal, 10.0)
                                        .background(.cyan)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        
                                    }.frame(width: 200)
                                }
                                .padding(.horizontal, 20)
                                
                                HStack(alignment: .top) {
                                    
                                    Text("Bio")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.accentColor)
                                    
                                    Spacer()
                                    
                                    TextEditor(text: $bio)
                                        .lineLimit(6)
                                        .font(.body)
                                        .multilineTextAlignment(.leading)
                                        .padding(.horizontal)
                                        .background(Color("lightgray"))
                                        .cornerRadius(24)
                                        .frame(minWidth: 200, idealWidth: 200, maxWidth: 200, minHeight: 40, idealHeight: 160, maxHeight: 260, alignment: .top)
                                    
//                                    TextField("", text: $bio)
                                        

                                 
                                }.padding(.horizontal, 20)
                                

                            }
                            .offset(y: -35)
                            

                        }
                        .background(
                            RoundedRectangle(cornerRadius: 32, style: .continuous)
                                .foregroundColor(.white)
                        )
                        .padding(.top, 150)
                    }
                    
                }

            }
            .navigationBarHidden(true)
        }
        
    }
}

struct EditMypROFILE_Previews: PreviewProvider {
    static var previews: some View {
        EditMypROFILE()
    }
}
