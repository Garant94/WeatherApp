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
        contentView.weatherStateLabel.text = viewModel.weatherState
        contentView.weatherDescriptionLabel.text = viewModel.weatherDescription
        contentView.temperatureMinLabel.text = viewModel.temperatureMin
        contentView.temperatureMaxLabel.text = viewModel.temperatureMax
        contentView.windSpeedLabel.text = viewModel.windSpeed
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
