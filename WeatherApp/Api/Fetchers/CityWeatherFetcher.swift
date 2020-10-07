import Foundation

protocol CityWeatherFetcher {
    func fetchWeather(for city: String, comletion: @escaping (CityWeather) -> Void)
}

class CityWeatherFetcherImpl: CityWeatherFetcher {

    private let apiProvider: ApiProvider

    init(apiProvider: ApiProvider) {
        self.apiProvider = apiProvider
    }

    func fetchWeather(for city: String, comletion: @escaping (CityWeather) -> Void) {
        let request = CityWeatherRequest(cityName: city)
        apiProvider.performRequest(request: request, comletion: comletion)
    }
}
