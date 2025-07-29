import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: Router?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let navigationController = UINavigationController()
        router = Router(navigationController: navigationController, storyboard: storyboard)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        // Start with login screen
        router?.navigate(to: .login)
        
        return true
    }
}


































