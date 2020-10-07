import Foundation

protocol WeatherDetailsPresenter {
    func city() -> String
}

class WeatherDetailsPresenterImpl: WeatherDetailsPresenter {
    
    private unowned let view: WeatherDetailsView
    private let cityName: String

    init(view: WeatherDetailsView, city: String) {
        self.view = view
        self.cityName = city
    }
    
    func city() -> String {
        cityName
    }
}
