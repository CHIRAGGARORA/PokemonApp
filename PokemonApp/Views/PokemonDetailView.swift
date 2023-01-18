//
//  PokemonDetailView.swift
//  PokemonApp
//
//  Created by chirag arora on 15/01/23.
//

import SwiftUI
import Kingfisher



let sampleNPoke = Pokemon(id: 1, name: "test", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "fire", weight: 10, height: 10, attack: 10, defense: 10, description: "test pokemon")

let sampleNVM = PokemonViewModel()


struct PokemonDetailView: View {
    
    @ObservedObject var viewModel = PokemonViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var pokemon: Pokemon
    
    var body: some View {
        ZStack{
            Color(viewModel.backgroundColor(forType: pokemon.type))
            ScrollView{
                Spacer()
                    .frame(height: 40)
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 400)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                DescriptionView(pokemon: pokemon)
                
                
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}) , trailing: Image(systemName: "ellipsis"))
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct BackButton: View {
    let action: () -> Void
    var body: some View{
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}

extension View{
    func cornerRadius(_
        radius: CGFloat,corners:UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius,corners: corners))
        }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: PokemonList[0])
    }
}

struct DescriptionView: View {
    var pokemon: Pokemon
    var body: some View {
        VStack(alignment: .leading) {
            Text(pokemon.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(pokemon.description)
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading){
                    Text("Details")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Height:\(pokemon.height) cm")
                        .opacity(0.6)
                    Text("Weight: \(pokemon.weight) kg")
                        .opacity(0.6)
                    Text("Type: \(pokemon.type)")
                        .opacity(0.6)
                    Text("Attack: \(pokemon.attack)")
                        .opacity(0.6)
                    Text("Defense: \(pokemon.defense)")
                        .opacity(0.6)
                    
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            
            
            
            
        }
        .padding()
        .padding(.top)
        .background(.white)
        .cornerRadius(30, corners: [.topLeft,.topRight])
        .offset(x: 0, y: 0)
    }
}
