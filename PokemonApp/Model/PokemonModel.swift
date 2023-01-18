//
//  PokemonModel.swift
//  PokemonApp
//
//  Created by chirag arora on 15/01/23.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Int
    let height: Int
    let attack: Int
    let defense: Int
    let description: String
    
}
let PokemonList: [Pokemon] = [
    .init(id: 1, name: "ivysaur", imageUrl: "", type: "Poison", weight: 10, height: 10, attack: 6, defense: 8, description: ""),
    .init(id: 1, name: "ivysaur", imageUrl: "", type: "Poison", weight: 10, height: 10, attack: 6, defense: 8, description: ""),
    .init(id: 1, name: "ivysaur", imageUrl: "", type: "Poison", weight: 10, height: 10, attack: 6, defense: 8, description: ""),
    .init(id: 1, name: "ivysaur", imageUrl: "", type: "Poison", weight: 10, height: 10, attack: 6, defense: 8, description: ""),
    .init(id: 1, name: "ivysaur", imageUrl: "", type: "Poison", weight: 10, height: 10, attack: 6, defense: 8, description: "")
]
