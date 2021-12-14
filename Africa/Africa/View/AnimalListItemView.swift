//
//  AnimalListItemView.swift
//  Africa
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct AnimalListItemView: View {
    // MARK:  properties
    let animal: Animal

    
    

    // MARK:  body
    var body: some View {
        HStack(alignment:.center,spacing:16) {
                buildAnimalImage()
            VStack(alignment: .leading, spacing: 8) {
                buildAnimalName()
                buildAnimalDescription()
            }
        }
    }
    
fileprivate func buildAnimalImage() -> some View {
        return Image(animal.image)
            .imageModifier1()
    }
    
fileprivate func buildAnimalName() -> some View {
        return Text(animal.name)
            .modifier1()
    }
    
fileprivate func buildAnimalDescription() -> some View {
        return Text(animal.description)
            .modifier2()
    }
}

// MARK:  preview
struct AnimalListItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    static var previews: some View {
        AnimalListItemView(animal:animals[11])
            .previewLayout(
                .sizeThatFits)
            .padding()
    }
}


extension Image {
    fileprivate func imageModifier1() -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: 90, height: 90, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        
    }
}





extension Text {
    fileprivate func modifier1() -> some View {
        return self
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundColor(.accentColor)
    }
    
    fileprivate func modifier2() -> some View {
        self
            .font(.footnote)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            .padding(.trailing,8)
    }
}
