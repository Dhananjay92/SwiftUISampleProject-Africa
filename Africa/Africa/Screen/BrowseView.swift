//
//  ContentView.swift
//  Africa
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct BrowseView: View {
    // MARK:  properties
    
    // MARK:  body
    var body: some View {
        NavigationView {
            VStack {
                CoverImageView()
                    .frame( height: 300)
                Spacer()
             
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("Browse"))
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
