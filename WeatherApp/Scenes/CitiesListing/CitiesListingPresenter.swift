import Foundation

protocol CitiesListingPresenter {
    var citiesCount: Int { get }
    func fetchWeather(for city: String)
    func cityName(at index: Int) -> String
}

class CitiesListingPresenterImpl: CitiesListingPresenter {

    private unowned let view: CitiesListingView
    private let cityWeatherFetcher: CityWeatherFetcher
    private let router: Router

    private var cities: [String] = []

    var citiesCount: Int {
        cities.count
    }

    init(view: CitiesListingView, cityWeatherFetcher: CityWeatherFetcher, router: Router) {
        self.view = view
        self.cityWeatherFetcher = cityWeatherFetcher
        self.router = router
    }

    func fetchWeather(for city: String) {
        cityWeatherFetcher.fetchWeather(for: city) { [weak self] weather in
            guard let `self` = self else { return }
            guard !self.cities.contains(weather.name) else { return }
            self.cities.append(weather.name)
            self.view.reloadListing()
            print(self.cities)
            
        }
    }

    func cityName(at index: Int) -> String {
        return cities.reversed()[index]
    }
}
