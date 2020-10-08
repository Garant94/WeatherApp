import Foundation
import Alamofire

protocol ApiProvider {
    func performRequest(request: ApiRequest, comletion: @escaping (CityWeather?, WeatherResponseError?) -> Void)
}

class ApiProviderImpl: ApiProvider {

    func performRequest(request: ApiRequest, comletion: @escaping (CityWeather?, WeatherResponseError?) -> Void) {
        let fullRequest = buildRequest(apiRequest: request)
        AF.request(fullRequest).responseDecodable(of: CityWeather.self) { response in
            switch response.result {
            case .success(let weather):
                comletion(weather, nil)
            case .failure:
                comletion(nil, WeatherForCityResponseError())
            }
        }
    }
    
    private func buildRequest(apiRequest: ApiRequest) -> String {
        "\(ApiConfig.baseUrl)\(apiRequest.url)&appid=\(ApiConfig.apiKey)"
    }
}
