//
//  pokeCell.swift
//  PokemonApp
//
//  Created by chirag arora on 15/01/23.
//

import SwiftUI
import Kingfisher

let samplePoke = Pokemon(id: 1, name: "test", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "fire", weight: 10, height: 10, attack: 10, defense: 10, description: "test pokemon")

let sampleVM = PokemonViewModel()


struct pokeCell: View {
    let pokemon:Pokemon
    @ObservedObject var viewModel = PokemonViewModel()
    let background: Color
    init(pokemon: Pokemon, viewModel: PokemonViewModel)
    {
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.background = Color(viewModel.backgroundColor(forType: "fire"))
        
    }
    
   
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.system(size: 20, weight: .semibold,design: .serif))
                    .foregroundColor(.black)
                    .shadow(color: .white, radius: 10)
                    .padding(.top, 20)
                    .padding(.leading)
                HStack{
                    Text(pokemon.type.capitalized)
                        .font(.system(size: 16, weight: .medium,design: .serif))
                        .foregroundColor(.black)
                        .shadow(color: .white, radius: 10)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(RoundedRectangle(cornerRadius: 14)
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 120,height: 24))
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing] , 4)
                    
                }
            }
        }.background(Color(viewModel.backgroundColor(forType: pokemon.type)))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.all, 6)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        
            .shadow(color: .black.opacity(0.4), radius: 8)
           // .shadow(color: .white.opacity(0.2), radius: 10,x: -10,y: -10)
    }
}

struct pokeCell_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            pokeCell(pokemon: PokemonList[1], viewModel: PokemonViewModel())
        }.previewLayout(.fixed(width: 200, height: 200))

        
    }
}
