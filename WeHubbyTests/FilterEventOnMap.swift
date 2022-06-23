//
//  FilterEventOnMap.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 22/06/2022.
//

import SwiftUI

struct FilterEventOnMap: View {
    
    var width: CGFloat = UIScreen.main.bounds.width - 50
    
    var widthbis: CGFloat = UIScreen.main.bounds.width - 120
    
    let items = 1...50
    
    let rows = [GridItem(.fixed(50)), GridItem(.fixed(50)), GridItem(.fixed(50))]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    @State var backgroundButton : Color = .white
    
    @Binding var selectedCategories : [Categoriz]
    
    @Binding var selectedType : [TypeEvents]
    
    @Binding var isFilteredSelected: Bool
    
    var body: some View {
        
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.black.opacity(0.2))
//                .background(.ultraThinMaterial)
                .blur(radius:10)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack{
                    Text("Par date")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                }.padding(.leading, 20)
                
                
                HStack{
                    Text("Par type d'évènement")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                }.padding(.leading, 20)
                
                LazyVGrid(columns: columns, alignment: .leading) {
                    
                    ForEach(typeEvents, id: \.self) { typePlace in
                        Button {
                            if isTypeSelected(typeEvents: typePlace) {
                                
                                selectedType.removeAll(where: {  $0 == typePlace })
                            
                            } else {
                                
                                selectedType.append(typePlace)
                            }
                            } label: {
                        Text(typePlace.rawValue)
                            .fontWeight(.bold)
                            .padding(.vertical,12)
                            .padding(.horizontal, 12)
                            .foregroundColor(isTypeSelected(typeEvents: typePlace) ? .accentColor : .white)
                            .background{
                                if isTypeSelected(typeEvents: typePlace) {
                                        Capsule()
                                    .fill(Color.white)
                                } else {
                                Capsule()
                                    .stroke(Color.white, lineWidth: 1.5)
                            }
                            }
                    }
                    }
                }.frame(width: 252)
                .padding(.leading, 30)
                .padding(.bottom)
                
                
                HStack{
                    Text("Par intérêt")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                }.padding(.leading, 15)
                
                
                
                LazyHGrid(rows: rows, alignment: .center, spacing: 10) {
                    
                    ForEach(categoris) { picture in
                        
                        Button {
                            
                            if isCategorySelected(categorie: picture) {
                                
                                selectedCategories.removeAll(where: {  $0.id == picture.id })
                            
                            } else {
                                
                                selectedCategories.append(picture)
                            }
                            
                        } label: {
                            Image(picture.picCategory)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(4)
                                .background(isCategorySelected(categorie: picture) ? .white : .accentColor)
                                .cornerRadius(16)
                            
                        }
                    }
                    
                }
                .padding(.leading, 20)
                
                HStack {
                    
                    Spacer()
                    Button {
                        
                        isFilteredSelected = false
                        
                    } label: {
                        
                        Image(systemName: "checkmark")
                            .font(.system(size: 28))
                            .padding(10)
                            .background(.white)
                            .cornerRadius(24)
                }
                }.padding(.trailing, 30)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .frame(width: width)
                    .foregroundColor(.accentColor)
                    .opacity(0.90)
                    .padding(1.5)
                    .background(.white)
                    .cornerRadius(24))
        .offset(y: -70)
        }
        
        
        
        
       
        
    }
    
    func isCategorySelected(categorie: Categoriz) -> Bool {
        
        return selectedCategories.contains(where: {  $0.id == categorie.id })
    }
    
    
    func isTypeSelected(typeEvents: TypeEvents) -> Bool {
        
        return selectedType.contains(where: {  $0 == typeEvents })
    }
}

struct FilterEventOnMap_Previews: PreviewProvider {
    static var previews: some View {
        FilterEventOnMap(selectedCategories: .constant([]), selectedType: .constant([]), isFilteredSelected: .constant(true))
    }
}
