import UIKit
import SnapKit

protocol CitiesListingView: class {
    func reloadListing()
}

class CitiesListingViewController: UIViewController, CitiesListingView, HasBackgroundGradient {
    
    private let searchBar = UISearchBar()
    private let tableView = UITableView()

    var presenter: CitiesListingPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
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
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        tableView.register(CityCell.self, forCellReuseIdentifier: CityCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.contentInset.top = 20
        tableView.showsVerticalScrollIndicator = false
    }
}

extension CitiesListingViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        presenter?.fetchWeather(for: text)
    }
}

extension CitiesListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.showDetailsForCity(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension CitiesListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.citiesCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.identifier, for: indexPath) as? CityCell else { fatalError("CityCell not registered")}
        cell.cityNameLabel.text = presenter?.cityName(at: indexPath.row)
        return cell
    }
    
    
}
