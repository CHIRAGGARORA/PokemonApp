//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by chirag arora on 15/01/23.
//

import Foundation
import SwiftUI


//MARK: - View Model of pokemon
class PokemonViewModel: ObservableObject{
    
    
    // object of pokemon model
    @Published var pokemon = [Pokemon]()
    
    // create base url of API
    let baseurl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    
    // calling the fetch method to call API
    init() {
        fetchdata()
    }
    
    
    // MARK: - Method to fetch data from API
    func fetchdata(){
        
        // fetch data from url
        guard let url = URL(string: baseurl) else {
            return
        }
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            
            // remove extra string and null from data
            guard let data = data?.parseData(removeString: "null,") else {
                return
            }
            
            // decode the data
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            // store this data
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    
    // MARK: - Method to add specific background based on pokemon type
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .orange
        case "poison": return .systemIndigo
        case "water": return .systemBlue
        case "electric": return .yellow
        case "psychic": return .brown
        case "normal": return .magenta
        case "ground": return .green
        case "flying": return .cyan
        case "fairy": return .systemTeal
        default: return .systemPink
            
        }
    }
    
}

// MARK: - an extension to remove null and string format from retrived data
extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        
        // replacing the occurence of unwanted string with empty string
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        // return data in form of utf8 format
        guard let data = parsedDataString?.data(using: .utf8) else {
            return nil
        }
        return data
    }
}
