import UIKit
import SnapKit

protocol CitiesListingView: class {
    func reloadListing()
}

class CitiesListingViewController: UIViewController, CitiesListingView {
    
    private let searchBar = UISearchBar()
    private let tableView = UITableView()

    var presenter: CitiesListingPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchBar()
        setupTableView()
    }
    
    func reloadListing() {
        tableView.reloadData()
    }
    
    private func setupSearchBar() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        tableView.register(CityCell.self, forCellReuseIdentifier: "CityCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CitiesListingViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        presenter?.fetchWeather(for: text)
    }
}

extension CitiesListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension CitiesListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.citiesCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityCell else { fatalError("CityCell not registered")}
        cell.cityNameLabel.text = presenter?.cityName(at: indexPath.row)
        return cell
    }
    
    
}
