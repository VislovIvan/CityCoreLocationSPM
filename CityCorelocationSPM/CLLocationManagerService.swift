import CoreLocation

public class CLLocationManagerService: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    public var onCityUpdated: ((String) -> Void)?

    public override init() {
        super.init()
        locationManager.delegate = self
        checkLocationAuthorization()
    }

    public func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    private func checkLocationAuthorization() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("Доступ к местоположению запрещен.")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let placemark = placemarks?.first, error == nil else { return }
            let city = placemark.locality ?? "Неизвестный город"
            self?.onCityUpdated?(city)
        }

        locationManager.stopUpdatingLocation()
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Ошибка определения местоположения: \(error.localizedDescription)")
    }
}
