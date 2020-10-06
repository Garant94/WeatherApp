import Foundation
import Alamofire

protocol ApiProvider {
    func performRequest(request: ApiRequest, comletion: @escaping (CityWeather) -> Void)
}

class ApiProviderImpl: ApiProvider {

    func performRequest(request: ApiRequest, comletion: @escaping (CityWeather) -> Void) {
        let fullRequest = buildRequest(apiRequest: request)
        AF.request(fullRequest).responseDecodable(of: CityWeather.self) { response in
            _ = response.map { comletion($0) }
        }
    }
    
    private func buildRequest(apiRequest: ApiRequest) -> String {
        "\(ApiConfig.baseUrl)\(apiRequest.url)&appid=\(ApiConfig.apiKey)"
    }
}
