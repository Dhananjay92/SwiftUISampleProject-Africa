//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by mehmet karanlık on 16.12.2021.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK:  properties
    
    let animal : Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals : [ Animal] = Bundle.main.decode(file: "animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
