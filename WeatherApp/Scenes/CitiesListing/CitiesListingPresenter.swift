import Foundation

protocol CitiesListingPresenter {
    var citiesCount: Int { get }
    func fetchWeather(for city: String)
    func cityName(at index: Int) -> String
    func showDetailsForCity(at index: Int)
}

class CitiesListingPresenterImpl: CitiesListingPresenter {

    private unowned let view: CitiesListingView
    private let cityWeatherFetcher: CityWeatherFetcher
    private let router: Router

    private var cityWeathers: [CityWeather] = []

    var citiesCount: Int {
        cityWeathers.count
    }

    init(view: CitiesListingView, cityWeatherFetcher: CityWeatherFetcher, router: Router) {
        self.view = view
        self.cityWeatherFetcher = cityWeatherFetcher
        self.router = router
    }

    func fetchWeather(for city: String) {
        cityWeatherFetcher.fetchWeather(for: city) { [weak self] weather in
            guard let `self` = self else { return }
            guard !self.cityWeathers.contains(weather) else { return }
            self.cityWeathers.insert(weather, at: 0)
            self.view.reloadListing()
        }
    }

    func cityName(at index: Int) -> String {
        return cityWeathers[index].name
    }
    
    func showDetailsForCity(at index: Int) {
        let cityWeather = cityWeathers[index]
        router.push(to: .weatherDetails(cityWeather: cityWeather), animated: true)
    }
}
