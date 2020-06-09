//
//  NetworkManager.swift
//  Pokedex
//
//  Created by Sejat Hakimi on 14.05.20.
//  Copyright © 2020 Sejat Hakimi. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
   
    
    
    @Published var type = Type(pokemon: [Pokekemon(pokemon: Pokemon(name: "", url: ""))], name: "" )
   
    @Published var pokemons = [Pokemon]()
    /*
    @Published var pokemonDetail = PokemonDetail(height: 1, is_default: false, name: "", sprites: Sprites(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"))
    */
    
    func fetchData() {
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=964") {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error ) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                        let result = try decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async {
                                self.pokemons = result.results
                                print("yes")
                                
                            }
                            
                            
                        }catch{
                            print("no")
                            print(error.localizedDescription)
                        }
                }
                
            }
            
        }
            task.resume()
    
    }
    }
        /*
}
    func fetchDetails(urlDetail: String) {
        if let url = URL(string: urlDetail) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error ) in
                    if error == nil {
                        let decoder = JSONDecoder()
                        if let safeData = data {
                            do {
                            let result = try decoder.decode(PokemonDetail.self, from: safeData)
                               
                                DispatchQueue.main.async {
                                    self.pokemonDetail = result.self
                                    print(self.pokemonDetail.height)
                                }
                                
                                
                            }catch{
                                print(error.localizedDescription)
                                print("here")
                            }
                    }
                    
                }
                
            }
            task.resume()
        }
        
    }
 */
    //MARK: - TypeSearching
    
    func fetchType(type: Int) {
        if let url = URL(string: "https://pokeapi.co/api/v2/type/\(type)/") {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, responsde, error ) in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let result = try decoder.decode(Type.self, from: safeData)
                        DispatchQueue.main.async {
                            self.type = result.self
                            
                        }
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
            }
            }
            task.resume()
        
    }
    

}
}

