import Foundation
import UIKit

struct WeatherDetailsContentViewModel {
    let city: String
    let temperature: (value: String, color: UIColor)
    let weatherState: String
    let weatherDescription: String
    let temperatureMin: String
    let temperatureMax: String
    let windSpeed: String
}

class WeatherDetailsContentView: UIView {

    let temperatureLabel = UILabel()
    let weatherStateLabel = UILabel()
    let weatherDescriptionLabel = UILabel()
    let temperatureMinLabel = UILabel()
    let temperatureMaxLabel = UILabel()
    let windSpeedLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupTemperatureLabel()
        setupWeatherStateLabel()
        setupWeatherDescriptionLabel()
        setupTemperatureMinLabel()
        setupTemperatureMaxLabel()
        setupWindSpeedLabel()
    }
    
    private func setupTemperatureLabel() {
        addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
//        temperatureLabel.font = UIFont(name: temperatureLabel.font.fontName, size: 50)
    }

    private func setupWeatherStateLabel() {
        addSubview(weatherStateLabel)
        weatherStateLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
    }

    private func setupWeatherDescriptionLabel() {
        addSubview(weatherDescriptionLabel)
        weatherDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherStateLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
    }

    private func setupTemperatureMinLabel() {
        addSubview(temperatureMinLabel)
        temperatureMinLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalTo(weatherDescriptionLabel.snp.bottom).offset(25)
        }
    }

    private func setupTemperatureMaxLabel() {
        addSubview(temperatureMaxLabel)
        temperatureMaxLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalTo(temperatureMinLabel.snp.bottom).offset(12)
        }
        
    }

    private func setupWindSpeedLabel() {
        addSubview(windSpeedLabel)
        windSpeedLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalTo(temperatureMaxLabel.snp.bottom).offset(12)
        }
        
    }
}
