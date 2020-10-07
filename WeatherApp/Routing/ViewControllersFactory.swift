import Foundation
import UIKit

protocol ViewControllersFactory {
    func controller(for route: Route, router: Router) -> UIViewController
}

class ViewControllersFactoryImpl: ViewControllersFactory {
    func controller(for route: Route, router: Router) -> UIViewController {
        switch route {
        case .citiesListing:
            return citiesListingController(router: router)
        case .weatherDetails:
            return WeatherDetailsViewController(nibName: nil, bundle: nil)
        }
    }
    
    private func citiesListingController(router: Router) -> UIViewController {
        let controller = CitiesListingViewController(nibName: nil, bundle: nil)
        let fetcher = CityWeatherFetcherImpl(apiProvider: ApiProviderImpl())
        let presenter = CitiesListingPresenterImpl(view: controller, cityWeatherFetcher: fetcher, router: router)
        controller.presenter = presenter
        return controller
    }
}
