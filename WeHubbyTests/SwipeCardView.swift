import SwiftUI

struct SwipeCardView: View {
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    
    @State private var toggleShadowColor: Bool = false
    
    var loisirs: Hobbies
    
    var body: some View {
        ZStack {
            
            //BackgroundIMG
            Image(loisirs.hobbyPic)
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 700)
                .clipped()
            
            //LinearShadow
                .overlay(Rectangle().fill(LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.2), color]), startPoint: .top, endPoint: .bottom))
                    .opacity(0.7)
                )
            //Title
            VStack(alignment: .leading) {
                Spacer().frame(height: 100)
                Text(loisirs.hobbyName)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                
                //Tags
                HStack {
                    ForEach(loisirs.hobbyTags, id: \.self) { tag in
                        Text(tag.rawValue)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .bold()
                            .padding(.all, 8.0)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .opacity(0.80)
                    }
                }
                
                //Description
                Text(loisirs.hobbyDescription)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .frame(height: 100)
                
                Spacer().frame(height: 75)
                
                //Buttons
                HStack {
                    
                    //Button for next card
                    Button("SUIVANT") {
                        swipeCard(width: -130)
                    }
                    .font(.title3.bold())
                    .frame(width: 145, height: 50)
                    .background(Color.red)
                    .cornerRadius(30)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
                    
                    Spacer().frame(width: 50)
                    //Button for LinkView
                    Button("DECOUVRIR") {
                        // Action on press
                        print("test")
                    }
                    .font(.title3.bold())
                    .frame(width: 145, height: 50)
                    .background(Color.green)
                    .cornerRadius(30)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 5)
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
        SwipeCardView(loisirs:loisirs[0])
        
    }
}
