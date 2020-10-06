import Foundation

protocol CitiesListingPresenter {
    func fetchWeather(for city: String)
    
}

class CitiesListingPresenterImpl: CitiesListingPresenter {
    
    private let cityWeatherFetcher: CityWeatherFetcher = CityWeatherFetcherImpl()
    private var cities: [String] = []
    
    unowned let view: CitiesListingView

    init(view: CitiesListingView) {
        self.view = view
    }
    
    func fetchWeather(for city: String) {
        cityWeatherFetcher.fetchWeather(for: city) { [weak self] weather in
            guard let `self` = self else { return }
            guard !self.cities.contains(weather.name) else { return }
            self.cities.append(weather.name)
            print(self.cities)
            
        }
    }
    
    
    
}
