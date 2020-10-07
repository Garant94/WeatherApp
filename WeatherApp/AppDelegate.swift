import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController(nibName: nil, bundle: nil)
        
        let router = RouterImpl(
            navigationController: navigationController,
            viewControllersFactory: ViewControllersFactoryImpl()
        )

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        router.start(root: .citiesListing)
        
        return true
    }


}

