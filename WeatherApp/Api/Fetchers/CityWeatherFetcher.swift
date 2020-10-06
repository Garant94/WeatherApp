import Foundation

protocol CityWeatherFetcher {
    func fetchWeather(for city: String)
}

class CityWeatherFetcherImpl: CityWeatherFetcher {
    private let apiProvider: ApiProvider = ApiProviderImpl()

    func fetchWeather(for city: String) {
        let request = CityWeatherRequest(cityName: city)
        apiProvider.performRequest(request: request)
    }
}
