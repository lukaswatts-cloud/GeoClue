import SwiftUI
import MapKit
import CoreLocation
import Combine

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -38.260, longitude: 145.200),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    @State private var path: [CLLocationCoordinate2D] = []

    /// How many path points you need before we look for a loop (avoids tiny “loops”).
    private let minPointsForLoop = 25
    /// How close the latest point must be to the first (meters). Tune for simulator vs real walks.
    private let closureDistanceMeters: CLLocationDistance = 40

    @State private var showLoopDetected = false
    @State private var wasClosedLastCheck = false

    var body: some View {
        ZStack(alignment: .top) {
            MapViewRepresentable(region: $region, path: path)
                .ignoresSafeArea()
                .onReceive(locationManager.$location) { location in
                    guard let location = location else { return }

                    let coordinate = location.coordinate

                    region.center = coordinate
                    path.append(coordinate)

                    updateLoopDetection()
                }

            if showLoopDetected {
                Text("Loop detected!")
                    .font(.headline)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.top, 60)
            }
        }
    }

    private func updateLoopDetection() {
        guard path.count >= minPointsForLoop,
              let start = path.first,
              let end = path.last else {
            wasClosedLastCheck = false
            showLoopDetected = false
            return
        }

        let startLocation = CLLocation(latitude: start.latitude, longitude: start.longitude)
        let endLocation = CLLocation(latitude: end.latitude, longitude: end.longitude)
        let distance = startLocation.distance(from: endLocation)

        let isClosedNow = distance <= closureDistanceMeters

        if isClosedNow && !wasClosedLastCheck {
            showLoopDetected = true
        } else if !isClosedNow {
            showLoopDetected = false
        }

        wasClosedLastCheck = isClosedNow
    }
}

// UIKit wrapper for MapKit (works reliably)
struct MapViewRepresentable: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var path: [CLLocationCoordinate2D]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.setRegion(region, animated: true)

        // Remove old overlays
        mapView.removeOverlays(mapView.overlays)

        // Add new path overlay
        let polyline = MKPolyline(coordinates: path, count: path.count)
        mapView.addOverlay(polyline)

        mapView.delegate = context.coordinator
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 4
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()

    @Published var location: CLLocation?

    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
    }
}
