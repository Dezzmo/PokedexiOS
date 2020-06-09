//
//  ContentView.swift
//  PokedexApp
//
//  Created by Sejat Hakimi on 09.06.20.
//  Copyright © 2020 Sejat Hakimi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            TabView{
                Text("My Pokemon")
                    .tabItem{
                        Image("pokeball")
                }
                List(self.networkManager.pokemons) { pokes in
                    Text(pokes.name.capitalizingFirstLetter())
                }
                .tabItem{
                    Image("pokedex")
                }
                
                
                
            }
            .navigationBarTitle("PokéDEX")
            .onAppear(){
                self.networkManager.fetchData()
            }
        }
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
