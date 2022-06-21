//
//  OnlyMapView.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 20/06/2022.
//

import SwiftUI
import MapKit

struct OnlyMapView: View {
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: evenements[0].coordonnnes,
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1
        )
    )
    
    @StateObject var managerDelegate = locationDelegate()
    
    @State var manager = CLLocationManager()
    
    @State var selectedEvent = 999
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            locations.last.map {
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                )
            }
        }
    
    @State var searchText = ""
    
    var body: some View {
        
        ZStack {
            
            
            Map(
                coordinateRegion: $region,
                interactionModes: MapInteractionModes.all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode,
                annotationItems: evenements
            ) { evenement in
                
                MapAnnotation(coordinate: evenement.coordonnnes) {
                    Image(evenement.eventHobby.hobbyPic)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50)
                        .clipShape(Circle())
                        .padding(4)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                            if let event = evenements.firstIndex(where: { $0 == evenement
                            })
                            {
                                
                                
                                withAnimation {
                                    
                                    selectedEvent = event
                                }
                            }
                        }
                    
                    
                }
                
                
                
            }
            
            .onChange(of: selectedEvent, perform: { newValue in
                
                print(newValue)
                
                if newValue != 999 {
                    withAnimation {
                        region.center = evenements[newValue].coordonnnes
                    }
                }
            })
            .onAppear{
                manager.delegate = managerDelegate
                if manager.location != nil {
                withAnimation {
                    region.center = manager.location!.coordinate
                }
                }
            }
            if selectedEvent != 999 {
                
                ShowEventonMap(evenement: evenements, selectedEvent: $selectedEvent)
                
            }

            VStack(spacing:0) {
                
                Button {
                    
                    
                } label : {
                    Image(systemName: "magnifyingglass")
                        .font(.system( size: 28))
                        .foregroundColor(.gray)
                        .padding(5)
                        .background(Color("whitty"))
                }
                    Divider().frame(width:16)
            Button {
                
                if manager.location != nil {
                withAnimation {
                    region.center = manager.location!.coordinate
                }
                }
            } label : {
                Image(systemName: "location.fill")
                    .font(.system( size: 28))
                    .foregroundColor(Color.gray)
                    .padding(5)
                    .background(Color("whitty"))
                
            }
            
                
            }
            .cornerRadius(12)
            .shadow(radius: 5)
            .offset(x: 150, y: 250)
        }
        
    }
}

struct OnlyMapView_Previews: PreviewProvider {
    static var previews: some View {
        OnlyMapView()
    }
}
class locationDelegate: NSObject,ObservableObject,CLLocationManagerDelegate{
    
    
    
    // Checking authorization status...
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if manager.authorizationStatus == .authorizedWhenInUse{
            print("Authorized")
            manager.startUpdatingLocation()
        } else {
            print("not authorized")
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
}


