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
    
    // MARK:  body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    CoverImageView()
                        .frame( height: 300)
                    Spacer()
                    ForEach(animals) { item in
                        Divider()
                        AnimalListItemView(animal: item)
                    }
                 
                }
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle(Text("Africa"))
            }
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
