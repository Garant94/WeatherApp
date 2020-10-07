import Foundation
import UIKit

enum Route {
    case citiesListing
    case weatherDetails
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
    }

    func push(to route: Route, animated: Bool) {
        navigationController.pushViewController(viewControllersFactory.controller(for: route, router: self), animated: animated)
    }

    func start(root: Route) {
        let controller = viewControllersFactory.controller(for: root, router: self)
        navigationController.setViewControllers([controller], animated: false)
    }
}
