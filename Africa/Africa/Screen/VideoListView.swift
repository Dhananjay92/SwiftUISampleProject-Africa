//
//  VideoListView.swift
//  Africa
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct VideoListView: View {
    // MARK:  property
    @State var videos : [Video] = Bundle.main.decode(file: "videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    
    
    // MARK:  body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                        ForEach(videos) { item in
                            NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name))
                            {
                                VideoListItem(video: item)
                                    .padding(.vertical,8)
                            }
                        }
                    }
            
                        .navigationTitle("Videos")
                        .navigationBarTitleDisplayMode(.large)
                        .toolbar {
                            ToolbarItem(placement:.navigationBarTrailing) {
                                Button(action: {
                                    videos.shuffle()
                                    hapticImpact.impactOccurred()
                                }) {
                                    Image(systemName: "arrow.2.squarepath")
                                }
                            }
                    }
            }
        
     }
 }
}





// MARK:  preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
