import XCTest
@testable import CityCorelocationSPM

final class CityCorelocationSPMTests: XCTestCase {
    func testCityViewInitialization() {
        let viewModel = CityViewModel()
        let cityView = CityView(viewModel: viewModel)
        
        XCTAssertNotNil(cityView)
    }
}
