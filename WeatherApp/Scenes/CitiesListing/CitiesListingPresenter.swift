import Foundation

protocol CitiesListingPresenter {
    var citiesCount: Int { get }
    func fetchWeather(for city: String)
    func cityName(at index: Int) -> String
}

class CitiesListingPresenterImpl: CitiesListingPresenter {
    
    private let cityWeatherFetcher: CityWeatherFetcher = CityWeatherFetcherImpl()
    private var cities: [String] = []
    
    unowned let view: CitiesListingView
    
    var citiesCount: Int {
        cities.count
    }

    init(view: CitiesListingView) {
        self.view = view
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
