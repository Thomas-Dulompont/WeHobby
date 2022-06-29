import SwiftUI

struct SwipeCardView: View {
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    
    @State private var toggleShadowColor: Bool = false
    
    var width: CGFloat = UIScreen.main.bounds.width
    var heigth: CGFloat = UIScreen.main.bounds.height
    
    var loisirs: Hobbies
    
    var body: some View {
        ZStack {
            
            //BackgroundIMG
            Image(loisirs.hobbyPic)
                .resizable()
                .scaledToFill()
                .frame(width: width)
                .clipped()
            
            //LinearShadow
                .overlay(Rectangle().fill(LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.2), color]), startPoint: .top, endPoint: .bottom))
                    .opacity(0.7)
                )
            //Title
            VStack(alignment: .leading) {
                Spacer().frame(height: 300)
                Text(loisirs.hobbyName.uppercased())
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                
                //Tags
                HStack {
                    ForEach(loisirs.hobbyTags, id: \.self) { tag in
                        Text(tag.rawValue.uppercased())
                            .font(.footnote)
                            .foregroundColor(.white)
                            .bold()
                            .padding(.all, 8.0)
                            .background(Color("CustomColorBlue"))
                            .cornerRadius(8)
                            .opacity(0.80)
                    }
                }
                
                //Description
                Text(loisirs.subtitleSwipe)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .frame(height: 50)
                
                Spacer().frame(height: 50)
                
                //Buttons
                HStack {
                    
                    //Button for next card
                    Button("SUIVANT") {
                        swipeCard(width: -130)
                    }
                    .font(.title3.bold())
                    .frame(width: 150, height: 55)
                    .background(Color("CustomColorRed"))
                    .cornerRadius(30)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.gray.opacity(0.25), radius: 4, x: 0, y: 4)
                    
                    Spacer()
                    //Button for LinkView
                    NavigationLink {
                        HobbyView(loisirs: loisirs)
                    } label: {
                        Text("DECOUVRIR")
                            .font(.title3.bold())
                            .frame(width: 150, height: 55)
                            .background(Color("CustomColorGreen"))
                            .cornerRadius(30)
                            .foregroundColor(Color.white)
                            .shadow(color: Color.gray.opacity(0.25), radius: 4, x: 0, y: 4)
                    }
                }
            }.padding()
        }
    .offset(x: offset.width * 1)
        .rotationEffect(.degrees(Double(0.0)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
                        if toggleShadowColor == true {
                            changeColor(width: offset.width)
                        }
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                        if toggleShadowColor == true {
                            changeColor(width: offset.width)
                        }
                    }
                }
        )
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-130):
            print("Next")
            offset = CGSize(width: -50000, height: 0)
        case 130...500:
            print("I Liked")
            offset = CGSize(width: 50000, height: 0)
        default:
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = Color("No").opacity(1)
        case 130...500:
            color = Color("Yes").opacity(1)
        default:
            color = .black
        }
    }
    
    
}

struct SwipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{SwipeCardView(loisirs:loisirs[0])}
        
    }
}
