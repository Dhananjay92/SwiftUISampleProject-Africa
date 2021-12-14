//
//  InsetGaleryView.swift
//  Africa
//
//  Created by mehmet karanlık on 15.12.2021.
//

import SwiftUI

struct InsetGaleryView: View {
    let animal :Animal
    var body: some View {
        ScrollView(.horizontal , showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height:200)
                    .cornerRadius(12)
                }
            }
        }
    }
}

struct InsetGaleryView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode(file: "animals.json")
    static var previews: some View {
        InsetGaleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
