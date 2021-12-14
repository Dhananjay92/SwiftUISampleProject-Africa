//
//  CoverImageView.swift
//  Africa
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct CoverImageView: View {
    // MARK:  properties
    let coverImages : [CoverImage] = Bundle.main.decode(file: "covers.json")
    // MARK:  body
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFit()                    
                    
            }// MARK:  loop
            
        }
        .tabViewStyle(
            PageTabViewStyle(
                indexDisplayMode: .always)
        )
        
    }
}




// MARK:  preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()

    }
}
