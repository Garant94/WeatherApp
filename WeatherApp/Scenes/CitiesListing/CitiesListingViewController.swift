import UIKit
import SnapKit

protocol CitiesListingView: class {

}

class CitiesListingViewController: UIViewController, CitiesListingView {
    
    private let searchController = UISearchController(searchResultsController: nil)

    var presenter: CitiesListingPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchController()
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
}

extension CitiesListingViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        presenter?.fetchWeather(for: text)
    }
}
