//
//  TypeView.swift
//  PokedexApp
//
//  Created by Sejat Hakimi on 10.06.20.
//  Copyright © 2020 Sejat Hakimi. All rights reserved.
//

import SwiftUI

struct TypeView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var type = 0
    
    var body: some View {
        
            List(self.networkManager.type.pokemon) { pokes in
                Text(pokes.pokemon.name.capitalizingFirstLetter())
            }
            .onAppear(){
                self.networkManager.fetchType(type: self.type)
            }
            .navigationBarTitle(K.types[type-1])
    }
}

struct TypeView_Previews: PreviewProvider {
    static var previews: some View {
        TypeView()
    }
}
