//
//  VideoPlayerView.swift
//  Africa
//
//  Created by mehmet karanlık on 15.12.2021.
//

import SwiftUI
import AVKit




struct VideoPlayerView: View {
    // MARK:  properties
    var videoSelected : String
    var videoTitle : String
    
    // MARK:  body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(filename: videoSelected, fileFormat: "mp4"))
            .overlay(
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(.top,6)
                .padding(.horizontal,6)
            , alignment: .topLeading
            
            
            )
            
        }
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
        .tint(.accentColor)
        
    }
}




// MARK:  preview
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
                .previewLayout(.sizeThatFits)
        }
    }
}
