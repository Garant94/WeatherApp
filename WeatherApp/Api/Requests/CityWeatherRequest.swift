import Foundation

struct CityWeatherRequest: ApiRequest {
    private let cityName: String
    var url: String {
        return "weather?q=\(cityName.replacingOccurrences(of: " ", with: "%20"))&units=metric"
    }
    
    init(cityName: String) {
        self.cityName = cityName
    }
}
