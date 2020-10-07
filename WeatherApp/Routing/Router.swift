import Foundation
import UIKit

enum Route {
    case citiesListing
    case weatherDetails
}

protocol Router {
    func push(to route: Route, animated: Bool)
    func setRootController(for route: Route, animated: Bool)
}

class RouterImpl: Router {

    private let navigationController: UINavigationController
    private let viewControllersFactory: ViewControllersFactory
    
    init(navigationController: UINavigationController, viewControllersFactory: ViewControllersFactory) {
        self.navigationController = navigationController
        self.viewControllersFactory = viewControllersFactory
    }
    
    func push(to route: Route, animated: Bool) {
        navigationController.pushViewController(viewControllersFactory.controller(for: route), animated: animated)
    }
    
    func setRootController(for route: Route, animated: Bool) {
        navigationController.setViewControllers([viewControllersFactory.controller(for: route)], animated: animated)
    }
}
