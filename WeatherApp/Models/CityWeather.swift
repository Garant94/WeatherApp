import Foundation

struct CityWeather: Codable, Equatable {
    let name: String
    let main: Temperature
    let wind: Wind
    let weather: [Weather]
}
