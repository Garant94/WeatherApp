import Foundation
import UIKit

enum Route {
    case citiesListing
    case weatherDetails(cityWeather: CityWeather)
}

protocol Router {
    func start(root: Route)
    func push(to route: Route, animated: Bool)
}

class RouterImpl: Router {

    private let navigationController: UINavigationController
    private let viewControllersFactory: ViewControllersFactory

    init(navigationController: UINavigationController, viewControllersFactory: ViewControllersFactory) {
        self.navigationController = navigationController
        self.viewControllersFactory = viewControllersFactory
        setupNavigationBar()
    }

    func push(to route: Route, animated: Bool) {
        navigationController.pushViewController(viewControllersFactory.controller(for: route, router: self), animated: animated)
    }

    func start(root: Route) {
        let controller = viewControllersFactory.controller(for: root, router: self)
        navigationController.setViewControllers([controller], animated: false)
    }
    
    private func setupNavigationBar() {
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
    }
}
