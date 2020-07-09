//
//  ContentView.swift
//  Pindrag
//
//  Created by Алтын on 7/8/20.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        MapView().edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MapView : UIViewRepresentable {
    
    func makeCoordinator() -> MapView.Coordinator {
        
        return MapView.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        
        let map = MKMapView()
        let coordinate = CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2707)
        
        map.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        
        map.addAnnotation(annotation)
        
        return map
    }
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
    }
    class Coordinator : NSObject, MKMapViewDelegate {
        
        var parent : MapView
        
        init(parent1 : MapView) {
            
            parent = parent1
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
        MKAnnotationView? {
            
            let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            
            pin.isDraggable = true
            pin.pinTintColor = .red
            pin.animatesDrop = true
            
            return pin
        }
    }
}
