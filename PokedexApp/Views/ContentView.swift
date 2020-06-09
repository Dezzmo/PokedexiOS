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
                Text("TypeSearch")
                    .tabItem{
                        Image("fire")
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

//MARK: - Extensions

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension UINavigationController{
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = UIColor(red: 0.60, green: 0.12, blue: 0.25, alpha: 1.00)
        
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.backgroundColor = UIColor(red: 0.85, green: 0.27, blue: 0.37, alpha: 1.00)
        
        navigationBar.standardAppearance = standardAppearance
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
        
        
        
    }
}
