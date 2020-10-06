import Foundation
import Alamofire

protocol ApiProvider {
    func performRequest(request: ApiRequest)
}

class ApiProviderImpl: ApiProvider {

    func performRequest(request: ApiRequest) {
        let fullRequest = buildRequest(apiRequest: request)
        AF.request(fullRequest).responseJSON { print($0) }
    }
    
    private func buildRequest(apiRequest: ApiRequest) -> String {
        "\(ApiConfig.baseUrl)\(apiRequest.url)&appid=\(ApiConfig.apiKey)"
    }
}
