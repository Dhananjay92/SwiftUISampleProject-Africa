//
//  GalleryView.swift
//  Africa
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct GalleryView: View {
    // MARK:  properties
   // let gridLayout : [GridItem] = [ GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    @State private var selectedAnimal : String = "lion"
    
    let animals : [Animal] = Bundle.main.decode(file: "animals.json")
    
    //let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Double = 3.0
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count:  Int(gridColumn))
    }
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK:  <#Description#>

    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                buildSelectedImage()
                buildSlider()
                buildGrid()
            }
            .padding(.horizontal,10) .padding(.vertical,50)
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity)
        .background(MotionAnimationView())
        
    }


    fileprivate func buildSlider() -> some View {
        return Slider(value: $gridColumn, in: 1...4)
            .padding(.horizontal)
            .onChange(of: gridColumn) { newValue in
                gridSwitch()
            }
    }
    
    fileprivate func buildSelectedImage() -> some View {
        return Image(selectedAnimal)
            .imageModifier1()
    }
    
    fileprivate func buildGrid() -> some View {
        return LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
            ForEach(animals) { item in
                Image(item.image)
                    .imageModifier1()
                    .onTapGesture {
                        selectedAnimal = item.image
                        haptics.impactOccurred()
                }
            }
        }
        .animation(.easeOut)
        .onAppear {
            gridSwitch()
    }
  }
}




// MARK:  preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}


extension Image {
    
    fileprivate func imageModifier1() -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.accentColor, lineWidth: 1))
    }
}
