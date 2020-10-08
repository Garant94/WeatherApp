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

    private let indicatorsStackView = UIStackView()
    private let iconsLicenseLabel = UILabel()
    
    let weatherStateImageView = UIImageView()
    let temperatureLabel = UILabel()
    let weatherDescriptionLabel = UILabel()
    let minTempIndicatorView = IndicatorView(image: UIImage(named: "tMin"))
    let maxTempIndicatorView = IndicatorView(image: UIImage(named: "tMax"))
    let windSpeedIndicatorView = IndicatorView(image: UIImage(named: "wind"))
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupWeatherStateImageView()
        setupTemperatureLabel()
        setupWeatherDescriptionLabel()
        setupIndicatorsStackView()
        setupIconsLicenseLabel()
    }
    
    private func setupWeatherStateImageView() {
        addSubview(weatherStateImageView)
        weatherStateImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width)
        }
    }
    
    private func setupTemperatureLabel() {
        addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.center.equalTo(weatherStateImageView)
        }
        temperatureLabel.font = UIFont(name: "TimesNewRomanPSMT", size: 60)
    }

    private func setupWeatherDescriptionLabel() {
        addSubview(weatherDescriptionLabel)
        weatherDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        weatherDescriptionLabel.textColor = .gray
    }
    
    private func setupIndicatorsStackView() {
        addSubview(indicatorsStackView)
        indicatorsStackView.snp.makeConstraints { make in
            make.top.equalTo(weatherStateImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(20)
            make.trailing.bottom.lessThanOrEqualToSuperview().inset(20)
        }
        
        indicatorsStackView.axis = .vertical
        indicatorsStackView.spacing = 12
        
        [minTempIndicatorView,
         maxTempIndicatorView,
         windSpeedIndicatorView].forEach { indicatorsStackView.addArrangedSubview($0) }
    }
    
    private func setupIconsLicenseLabel() {
        addSubview(iconsLicenseLabel)
        iconsLicenseLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(2)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(2)
        }
        iconsLicenseLabel.font = UIFont(name: "TimesNewRomanPSMT", size: 8)
        iconsLicenseLabel.textColor = .gray
        iconsLicenseLabel.text = "Icons made by https://www.flaticon.com/authors/freepik"
    }
}
