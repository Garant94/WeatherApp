import UIKit

protocol CitiesListingView {

}

class CitiesListingViewController: UIViewController, CitiesListingView {

    weak var presenter: CitiesListingPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchWeather(for: "London")

    }


}

