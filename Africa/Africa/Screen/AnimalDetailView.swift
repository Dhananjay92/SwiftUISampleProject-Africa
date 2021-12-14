//
//  AnimalDetailView.swift
//  Africa
//
//  Created by mehmet karanlık on 15.12.2021.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK:  properties
    let animal : Animal
    
    // MARK:  body
    var body: some View {
       
        ScrollView(showsIndicators:false) {
                VStack(alignment: .center, spacing: 20) {
                    // Hero image
                    Image(animal.image)
                        .resizable()
                        .scaledToFit()
                    // TITLE
                    Text(animal.name.uppercased())
                        .textModifier1()
                       
                    
                    //HEADLINE
                    Text(animal.headline)
                        .textModifier2()

                    // GALLERY
                    Group {
                        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                        InsetGaleryView(animal: animal)
                    }
                    .padding(.horizontal)
               
                    // FACTS
                    Group {
                        HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                        InsetFactView(animal: animal)
                        
                    }
                    .padding(.horizontal)
                    //DESCRIPTION
                    Group {
                        HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                        Text(animal.description)
                            .multilineTextAlignment(.leading)
                            .layoutPriority(1)
                    }
                    .padding(.horizontal)
                    //MAP
                    Group {
                        HeadingView(headingImage: "map", headingText: "National Parks")
                        InsetMapView()
                    }
                    .padding(.horizontal)
                    
                    
                    
                    
                    //LINK
                    
                    Group {
                        HeadingView(headingImage: "books.vertical", headingText: "Learn More!")
                        ExternalWebLinkView(animal: animal)
                    }
                    .padding(.horizontal)
                
                
                
                
                }
                .navigationTitle("Learn more about \(animal.name)")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.bottom,30)
            }
        }
    
}



// MARK:  preview
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
         
        }
    }
}


extension Text {
    fileprivate func textModifier1() -> some View {
        self
            .font(.largeTitle)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
            .padding(.vertical,8)
            .foregroundColor(.primary)
            .background(
                Color.accentColor
                    .frame( height: 6)
                    .offset(y:20)
            )
    }
    fileprivate func textModifier2() -> some View {
        self
            .font(.headline)
            .multilineTextAlignment(.leading)
            .foregroundColor(.accentColor)
            .padding(.horizontal)
    }
}



