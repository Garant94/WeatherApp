import UIKit
import SnapKit

protocol WeatherDetailsView: class {
}

class WeatherDetailsViewController: UIViewController, WeatherDetailsView {
    
    private let label = UILabel()
    
    var presenter: WeatherDetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        label.text = presenter?.city()
        label.textColor = .black

        // Do any additional setup after loading the view.
        
    }
    
}
