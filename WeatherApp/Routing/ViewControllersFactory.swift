import Foundation
import UIKit

protocol ViewControllersFactory {
    func controller(for route: Route) -> UIViewController
}

class ViewControllersFactoryImpl: ViewControllersFactory {
    func controller(for route: Route) -> UIViewController {
        switch route {
        case .citiesListing:
            return CitiesListingViewController(nibName: nil, bundle: nil)
        case .weatherDetails:
            return WeatherDetailsViewController(nibName: nil, bundle: nil)
        }
    }
}
