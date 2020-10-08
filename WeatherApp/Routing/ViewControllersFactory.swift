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
        case .weatherDetails(let cityWeather):
            return weatherDetailsController(cityWeather: cityWeather)
        }
    }
    
    private func citiesListingController(router: Router) -> UIViewController {
        let controller = CitiesListingViewController(nibName: nil, bundle: nil)
        let fetcher = CityWeatherFetcherImpl(apiProvider: ApiProviderImpl())
        let presenter = CitiesListingPresenterImpl(view: controller, cityWeatherFetcher: fetcher, router: router)
        controller.presenter = presenter
        return controller
    }
    
    private func weatherDetailsController(cityWeather: CityWeather) -> UIViewController {
        let controller = WeatherDetailsViewController(nibName: nil, bundle: nil)
        let formatter = WeatherDetailsFormatterImpl()
        let presenter = WeatherDetailsPresenterImpl(view: controller, cityWeather: cityWeather, weatherFormatter: formatter)
        controller.presenter = presenter
        return controller
    }
}
