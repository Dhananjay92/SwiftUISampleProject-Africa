//
//  ContentView.swift
//  Africa
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct BrowseView: View {
    // MARK:  properties
    let animals : [Animal] = Bundle.main.decode(file: "animals.json")
    @State private var isGridViewActive : Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    
        
        
        
    // MARK:  body

    
    var body: some View {
        NavigationView {
            Group {
                if isGridViewActive == false {
                    buildListView()
                } else {
                    buildGridView()
        }
    }
    .navigationBarTitleDisplayMode(.large)
    .navigationTitle(Text("Africa"))
    .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                    buildListButton()
                    buildGridButton()
                    }
                }
            }
        }
    }
    fileprivate func buildListView() -> some View {
        return ScrollView {
            VStack {
                CoverImageView()
                    .frame( height: 300)
                Spacer()
                ForEach(animals) { item in
                    NavigationLink(destination: AnimalDetailView(animal: item)) {
                        Divider()
                        AnimalListItemView(animal: item)
                        
                        
                    }
                }
                
            }
            
        }
    }
    
    fileprivate func buildGridView() -> some View {
        return ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalGridItemView(animal: animal)
                    }
                }
            }
            .padding(10)
            .animation(.easeIn)
        }
    }
    
    fileprivate func buildListButton() ->  some View {
        return Button {
            print("List view activated")
            isGridViewActive = false
            haptics.impactOccurred()
        } label: {
            Image(systemName: "square.fill.text.grid.1x2")
                .foregroundColor(isGridViewActive ? .primary: .accentColor)
        }
    }
    
    fileprivate func buildGridButton() -> some View {
        return Button {
            print("Grid view activated")
            isGridViewActive = true
            haptics.impactOccurred()
        } label: {
            Image(systemName: "square.grid.2x2")
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
        }
    }



}







// MARK:  preview
struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
            .preferredColorScheme(.dark)
            
    }
}
