//
//  LocationModel.swift
//  Africa
//
//  Created by mehmet karanlık on 15.12.2021.
//

import Foundation
import MapKit

struct NationalParkLocation : Codable,Identifiable {
    let id : String
    let name : String
    let image : String
    let latitude : Double
    let longitude : Double
    
    // computed property
    
    var location : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
