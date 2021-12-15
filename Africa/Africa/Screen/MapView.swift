//
//  MapView.swift
//  Africa
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI
import MapKit



struct MapView: View {
    // MARK:  properties
    
    @State private var region : MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel =  MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations : [NationalParkLocation] = Bundle.main.decode(file: "locations.json")
    
    
    
    
    
        
    // MARK:  body
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            MapAnnotation(coordinate: item.location) {
                MapAnotationView(location: item)}}
        )
            .overlay(alignment:.top) {
                HStack {
                    Image("compass")
                        .imageModifier1()
                    VStack(alignment: .leading, spacing: 3) {
                        buildLatitudeValue()
                        Divider()
                        buildLongitudeValue()
                        
                    }
                }
                .hstackModifier1()
                
        }
    }
    
    
    fileprivate func buildLongitudeValue() -> some View {
        return HStack {
            Text("Longitude:")
                .textModifier1()
            Spacer()
            Text("\(region.center.longitude)")
                .textModifier2()
            
        }
    }
    
    fileprivate func buildLatitudeValue() ->  some View {
        return HStack {
            Text("Latitude:")
                .textModifier1()
            Spacer()
            Text("\(region.center.latitude)")
                .textModifier2()
            
        }
    }
}





// MARK:  preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


extension HStack {
    fileprivate func hstackModifier1() -> some View {
        self
            .padding(.vertical,12)
            .padding(.horizontal,16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6))
            .padding()
    }
}

extension Image {
    
    
    fileprivate func imageModifier1() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 48, height: 48, alignment:.center)
    }
}

extension Text {
    
    
    fileprivate func textModifier1() -> some View {
        self
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundColor(.accentColor)
    }
    
    
    fileprivate func textModifier2() -> some View {
        self
            .font(.footnote)
            .foregroundColor(.white)
    }
}
