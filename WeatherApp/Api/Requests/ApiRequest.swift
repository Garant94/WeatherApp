import Foundation

protocol WeatherResponseError: Error {
    var message: String { get }
}

protocol ApiRequest {
    var url: String { get }
}
