import Foundation

protocol WeatherDetailsPresenter {
    func details() -> WeatherDetailsContentViewModel
}

class WeatherDetailsPresenterImpl: WeatherDetailsPresenter {
    
    private unowned let view: WeatherDetailsView
    private let cityWeather: CityWeather
    private let weatherFormatter: WeatherDetailsFormatter

    init(view: WeatherDetailsView, cityWeather: CityWeather, weatherFormatter: WeatherDetailsFormatter) {
        self.view = view
        self.cityWeather = cityWeather
        self.weatherFormatter = weatherFormatter
    }
    
    func details() -> WeatherDetailsContentViewModel {
        weatherFormatter.format(weather: cityWeather)
    }
}
