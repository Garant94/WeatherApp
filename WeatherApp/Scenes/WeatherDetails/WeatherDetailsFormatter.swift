import Foundation
import UIKit

protocol WeatherDetailsFormatter {
    func format(weather: CityWeather) -> WeatherDetailsContentViewModel
}

class WeatherDetailsFormatterImpl: WeatherDetailsFormatter {
    func format(weather: CityWeather) -> WeatherDetailsContentViewModel {
        WeatherDetailsContentViewModel(
            city: weather.name,
            temperature: formatMainTemperature(value: weather.main.temp) ,
            weatherState: weather.weather.first?.main.lowercased(),
            weatherDescription: weather.weather.first?.description,
            temperatureMin: formatTemperature(value: weather.main.tempMin),
            temperatureMax: formatTemperature(value: weather.main.tempMax),
            windSpeed: "\(weather.wind.speed) m/s"
        )
    }
    
    private func formatMainTemperature(value: Double) -> (String, UIColor) {
        let color = formatColor(for: value)
        let stringValue = formatTemperature(value: value)
        return (stringValue, color)
    }
    
    private func formatColor(for value: Double) -> UIColor {
        switch value {
        case 10...20: return .black
        case 21...: return .red
        default: return .blue
        }
    }
    
    private func formatTemperature(value: Double) -> String {
        let stringValue = String(format: "%.1f", value)
        return stringValue + "°C"
    }
}
