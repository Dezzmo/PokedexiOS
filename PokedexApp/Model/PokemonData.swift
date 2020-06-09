//
//  PokemonData.swift
//  Pokedex
//
//  Created by Sejat Hakimi on 14.05.20.
//  Copyright © 2020 Sejat Hakimi. All rights reserved.
//

import Foundation



struct Type: Decodable {
    let pokemon: [Pokekemon]
    let name: String
}

struct Pokekemon: Decodable, Identifiable {
    let id = UUID()
    let pokemon: Pokemon
}


struct Result: Decodable {
    let results: [Pokemon]
    
}


struct Pokemon: Decodable, Identifiable  {
    
    let id = UUID()
    let name: String
    let url: String
  
}
/*

struct Sprites: Decodable {
    
    let front_default: String

}

struct PokemonDetail: Decodable {
    let height: Int
    let is_default: Bool
    let name: String
    let sprites: Sprites
    
}
    

*/
