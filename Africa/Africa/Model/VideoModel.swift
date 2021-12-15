//
//  VideoModel.swift
//  Africa
//
//  Created by mehmet karanlık on 15.12.2021.
//

import Foundation

struct Video : Codable, Identifiable{
    let id : String
    let name : String
    let headline : String
    
    // Computed property
    
    
    var thumbnail : String {
        "video-\(id)"
    }
}
