//
//  PokemonGridView.swift
//  PokemonApp
//
//  Created by chirag arora on 15/01/23.
//

import SwiftUI

struct PokemonGridView: View {
    
    private let gridItems = [GridItem(.flexible()),GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.4),Color.pink.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    LazyVGrid(columns: gridItems,spacing: 16) {
                        ForEach(viewModel.pokemon){
                            pokemon in
                            NavigationLink {
                                PokemonDetailView(viewModel: viewModel, pokemon: pokemon)
                            } label: {
                                pokeCell(pokemon: pokemon, viewModel: viewModel)
                            }

                        }
                    }
                }.navigationTitle("Pokemon Club")
                               
                    
            }
        }
    }
}

struct PokemonGridView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGridView()
    }
}
