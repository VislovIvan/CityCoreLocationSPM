import Foundation
import CoreLocation

public class CityViewModel: NSObject, CLLocationManagerDelegate {
    private let locationManagerService: CLLocationManagerService
    public var onCityUpdated: ((String) -> Void)?
    
    public override init() {
        self.locationManagerService = CLLocationManagerService()
        super.init()
        
        locationManagerService.onCityUpdated = { [weak self] city in
            self?.onCityUpdated?(city)
        }
    }
    
    public func startUpdatingLocation() {
        locationManagerService.startUpdatingLocation()
    }
}
