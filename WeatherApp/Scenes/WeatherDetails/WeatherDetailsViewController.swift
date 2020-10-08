import UIKit
import SnapKit

protocol WeatherDetailsView: class {
}

class WeatherDetailsViewController: UIViewController, WeatherDetailsView, HasBackgroundGradient {
    
    private let contentView = WeatherDetailsContentView()
    
    var presenter: WeatherDetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configure()
    }
    
    func configure() {
        guard let viewModel = presenter?.details() else { return }
        navigationItem.title = viewModel.city
        contentView.temperatureLabel.text = viewModel.temperature.value
        contentView.temperatureLabel.textColor = viewModel.temperature.color
        contentView.weatherStateImageView.image = UIImage(named: viewModel.weatherState) ?? UIImage(named: "Default")
        contentView.weatherDescriptionLabel.text = viewModel.weatherDescription
        contentView.minTempIndicatorView.textLabel.text = viewModel.temperatureMin
        contentView.maxTempIndicatorView.textLabel.text = viewModel.temperatureMax
        contentView.windSpeedIndicatorView.textLabel.text = viewModel.windSpeed
    }

    private func setupViews() {
        setupBackground()
        setupContentView()
    }
    
    private func setupContentView() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
