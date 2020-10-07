import Foundation

protocol WeatherDetailsPresenter {
    func city() -> String
}

class WeatherDetailsPresenterImpl: WeatherDetailsPresenter {
    
    private unowned let view: WeatherDetailsView
    private let cityWeather: CityWeather

    init(view: WeatherDetailsView, cityWeather: CityWeather) {
        self.view = view
        self.cityWeather = cityWeather
    }
    
    func city() -> String {
        cityWeather.name
    }
}
