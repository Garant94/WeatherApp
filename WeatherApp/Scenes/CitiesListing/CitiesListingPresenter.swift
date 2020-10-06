import Foundation

protocol CitiesListingPresenter: class {
    func fetchWeather(for city: String)
    
}

class CitiesListingPresenterImpl: CitiesListingPresenter {
    
    private let cityWeatherFetcher: CityWeatherFetcher = CityWeatherFetcherImpl()
    
    private let view: CitiesListingView
    
    init(view: CitiesListingView) {
        self.view = view
    }
    
    func fetchWeather(for city: String) {
        cityWeatherFetcher.fetchWeather(for: city)
    }
    
    
    
}
