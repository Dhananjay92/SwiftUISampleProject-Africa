//
//  MapAnotationView.swift
//  Africa
//
//  Created by mehmet karanlık on 16.12.2021.
//

import SwiftUI

struct MapAnotationView: View {
    // MARK:  properties
    var location : NationalParkLocation
    @State private var animation : Double = 0
    
    
    
    // MARK:  body
    var body: some View {
        ZStack {
            Circle()
                .circleModifier1()

            Circle()
                .circleModifier2(animation: animation)

                
            Image(location.image)
                .imageModifier1()

        }
        .onAppear {
            withAnimation(Animation
                            .easeOut(duration: 2)
                            .repeatForever(autoreverses: false)) {
                animation = 1
                
            }
        }
        
    }
}





// MARK:  preview
struct MapAnotationView_Previews: PreviewProvider {
    static var locations: [NationalParkLocation] = Bundle.main.decode(file: "locations.json")
    static var previews: some View {
        MapAnotationView(location: locations[0])
        .previewLayout(.sizeThatFits)
        .padding()
    }
}



extension Circle {
    
    fileprivate func circleModifier1() -> some View {
        self
            .fill(Color.accentColor)
            .frame(width: 54, height: 54, alignment: .center)
    }
    
    
    fileprivate func circleModifier2(animation : Double) -> some View {
        self
            .stroke(Color.accentColor,lineWidth: 2)
            .frame(width: 52, height: 52, alignment: .center)
            .scaleEffect(1+CGFloat(animation))
            .opacity(1-animation)
    }
}



extension Image {
    
    
    fileprivate func imageModifier1() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
    }
}
