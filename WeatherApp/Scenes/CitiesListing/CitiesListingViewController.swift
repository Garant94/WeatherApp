import UIKit

protocol CitiesListingView: class {

}

class CitiesListingViewController: UIViewController, CitiesListingView {

    var presenter: CitiesListingPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchWeather(for: "London")

    }


}

