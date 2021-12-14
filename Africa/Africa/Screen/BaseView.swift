//
//  BaseView.swift
//  Africa
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct BaseView: View {
    // MARK:  properties
    
    
    
    // MARK:  body
    var body: some View {
        TabView {
            
            BrowseView()
                .tabItem {
                    
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                    
                }
            
            VideoListView()
                .tabItem {
                    
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                    
                }
            
            MapView()
                .tabItem {
                    
                    Image(systemName: "map")
                    Text("Locations")
                    
                }
            
            GalleryView()
                .tabItem {
                    
                    Image(systemName: "photo")
                    Text("Gallery")
                    
                }
        }
    }
}


// MARK:  preview
struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
         
    }
}
