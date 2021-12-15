//
//  GalleryView.swift
//  Africa
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            Text("GalleryView")
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
