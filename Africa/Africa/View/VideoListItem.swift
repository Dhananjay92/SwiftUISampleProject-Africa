//
//  VideoListItem.swift
//  Africa
//
//  Created by mehmet karanlık on 15.12.2021.
//

import SwiftUI

struct VideoListItem: View {
    // MARK:  properties
    
    let video : Video
    
    
    // MARK:  body

    

    
    var body: some View {
        HStack(spacing:20) {
            ZStack {
                Image(video.thumbnail)
                        .imageModifier1()
                buildPlayIcon()
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
               
        }
    }

    fileprivate func buildPlayIcon() -> some View {
        return Image(systemName: "play.circle")
            .resizable()
            .scaledToFit()
            .frame(height:32)
            .shadow( radius: 4)
    }



}









// MARK:  preview
struct VideoListItem_Previews: PreviewProvider {
    static var videos : [Video] = Bundle.main.decode(file: "videos.json")
    static var previews: some View {
        VideoListItem(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}




extension Image {
    
    fileprivate func imageModifier1() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(height:80)
            .cornerRadius(8)
        
    }
    
}


