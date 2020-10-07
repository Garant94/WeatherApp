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
        case .weatherDetails(let city):
            return weatherDetailsController(city: city)
        }
    }
    
    private func citiesListingController(router: Router) -> UIViewController {
        let controller = CitiesListingViewController(nibName: nil, bundle: nil)
        let fetcher = CityWeatherFetcherImpl(apiProvider: ApiProviderImpl())
        let presenter = CitiesListingPresenterImpl(view: controller, cityWeatherFetcher: fetcher, router: router)
        controller.presenter = presenter
        return controller
    }
    
    private func weatherDetailsController(city: String) -> UIViewController {
        let controller = WeatherDetailsViewController(nibName: nil, bundle: nil)
        let presenter = WeatherDetailsPresenterImpl(view: controller, city: city)
        controller.presenter = presenter
        return controller
    }
}
