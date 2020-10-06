import Foundation

protocol CitiesListingPresenter {
    func fetchWeather(for city: String)
    
}

class CitiesListingPresenterImpl: CitiesListingPresenter {
    
    private let cityWeatherFetcher: CityWeatherFetcher = CityWeatherFetcherImpl()
    
    unowned let view: CitiesListingView
    
    init(view: CitiesListingView) {
        self.view = view
    }
    
    func fetchWeather(for city: String) {
        cityWeatherFetcher.fetchWeather(for: city)
    }
    
    
    
}
