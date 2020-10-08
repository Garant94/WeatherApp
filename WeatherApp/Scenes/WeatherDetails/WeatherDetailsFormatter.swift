import Foundation

protocol WeatherDetailsFormatter {
    func format(weather: CityWeather) -> WeatherDetailsContentViewModel
}

class WeatherDetailsFormatterImpl: WeatherDetailsFormatter {
    func format(weather: CityWeather) -> WeatherDetailsContentViewModel {
        WeatherDetailsContentViewModel(
            city: weather.name,
            temperature: ("t: \(weather.main.temp)", .blue),
            weatherState: "state: \(weather.weather[0].main)",
            weatherDescription: "desc: \(weather.weather[0].description)",
            temperatureMin: "tMin: \(weather.main.tempMin)",
            temperatureMax: "tMax: \(weather.main.tempMax)",
            windSpeed: "W speed: \(weather.wind.speed)"
        )
    }
    
    
}
