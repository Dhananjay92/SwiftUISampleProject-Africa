//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by mehmet karanlık on 15.12.2021.
//

import SwiftUI

struct ExternalWebLinkView: View {
    // MARK:  properties
    
    let animal : Animal
    
    
    // MARK:  body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name,
                         destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}




// MARK:  preview
struct ExternalWebLinkView_Previews: PreviewProvider {
    static var animals : [Animal] = Bundle.main.decode(file: "animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
