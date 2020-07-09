//
//  ContentView.swift
//  Pindrag
//
//  Created by Алтын on 7/8/20.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var title = ""
    @State var subtitle = ""
    
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
            MapView(title: self.$title, subtitle: self.$subtitle).edgesIgnoringSafeArea(.all)
            
            if self.title != "" {
                HStack(spacing: 12) {
                    Image(systemName: "info.circle.fill").font(.largeTitle).foregroundColor(.black)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text(self.title).font(.body).foregroundColor(.black)
                        Text(self.subtitle).font(.caption).foregroundColor(.gray)
                    }
                }.padding()
                .background(Color("Color"))
                .cornerRadius(15)
            }
        })
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
    
    @Binding var title : String
    @Binding var subtitle : String
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        
        let map = MKMapView()
        let coordinate = CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2707)
        
        map.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        
        map.delegate = context.coordinator
        
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
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
            
            CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)) { (places, err) in
                
                if err != nil {
                    
                    print((err?.localizedDescription)!)
                    return
                }
                
                self.parent.title = (places?.first?.name ?? places?.first?.postalCode)!
                self.parent.subtitle = (places?.first?.locality ?? places?.first?.country ?? "None")
            }
        }
    }
}
