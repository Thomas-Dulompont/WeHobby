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
    
    @State var filteredEvents : [Events] = evenements
    
    @State var isFilteredSelected : Bool = false
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
        }
    }
    
    @State var selectedCategories: [Categoriz] = []
    
    @State var selectedType : [TypeEvents] = []

    
    var body: some View {
        
        ZStack {
            
            
            Map(
                coordinateRegion: $region,
                interactionModes: MapInteractionModes.all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode,
                annotationItems: filteredEvents
            ) { evenement in
                
                MapAnnotation(coordinate: evenement.coordonnnes) {
                    Image(evenement.catego.picCategory)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50)
                        .clipShape(Circle())
                        .padding(4)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                            if let event = filteredEvents.firstIndex(where: { $0 == evenement
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
                        region.center = filteredEvents[newValue].coordonnnes
                        region.span =  MKCoordinateSpan(
                            latitudeDelta: 0.1,
                            longitudeDelta: 0.1
                        )
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
                
                ShowEventonMap(evenement: filteredEvents, selectedEvent: $selectedEvent)
                
            }
            
            if isFilteredSelected {
                
                FilterEventOnMap(selectedCategories: $selectedCategories, selectedType: $selectedType, isFilteredSelected: $isFilteredSelected)
                
                .onChange(of: selectedCategories) { newValue in
                    
                        filteredEvent()
                    
                }
                
                .onChange(of: selectedType) { newValue in
                    
                            filteredEvent()
                    
                }
            }
            
            VStack(spacing:0) {
                
                Button {
                    
                    withAnimation  {
                    isFilteredSelected.toggle()
                    
                    }
                    
                } label : {
                    Image(systemName: "slider.horizontal.3")
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
                            region.span =  MKCoordinateSpan(
                                latitudeDelta: 0.1,
                                longitudeDelta: 0.1
                            )
                        }
                    }
                } label : {
                    Image(systemName: "location.fill")
                        .font(.system( size: 28))
                        .foregroundColor(Color.gray)
                        .padding(6)
                        .background(Color("whitty"))
                    
                }
                
                
            }
            .cornerRadius(12)
            .shadow(radius: 5)
            .offset(x: 150, y: 250)
        }
        
    }
    
    func filteredEvent() {
        
        selectedEvent = 999
        
        if selectedCategories.isEmpty && selectedType.isEmpty {
            
            filteredEvents = evenements
            
        } else {
            
            filteredEvents = evenements
                
                .filter({ events in
                
                if !selectedCategories.isEmpty {
               return selectedCategories.contains( where: { categori in
                    events.catego.id == categori.id
                })
                } else {
                    return true
                }
                

                
            })
            .filter({ events in
                
                if !selectedType.isEmpty {
               return  selectedType.contains(where: { type in
                   events.type == type
               })
                } else {
                    return true
                
                }
            })
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


