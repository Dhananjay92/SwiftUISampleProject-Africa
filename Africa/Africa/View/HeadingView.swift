//
//  HeadingView.swift
//  Africa
//
//  Created by mehmet karanlık on 15.12.2021.
//

import SwiftUI

struct HeadingView: View {
    // MARK:  properties
    
    var headingImage: String
    var headingText:String
    
    
    
    // MARK:  body
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}





// MARK:  preview
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
