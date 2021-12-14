//
//  InsetFactView.swift
//  Africa
//
//  Created by mehmet karanlık on 15.12.2021.
//

import SwiftUI

struct InsetFactView: View {
    // MARK:  properties
    
    
    let animal : Animal
    // MARK:  body
    var body: some View {
        GroupBox{
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                    
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight:140, idealHeight: 160, maxHeight: 180)
        }
    }
}



// MARK:  preview
struct InsetFactView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode(file: "animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
