// Router.swift
import UIKit

final class Router {
    
    enum AuthFlow: String {
        case login
        case forgotPassword
        case emailSent
        case profile
    }
    
    private(set) var navPath: [AuthFlow] = []
    private weak var navigationController: UINavigationController?
    private let storyboard: UIStoryboard
    
    init(navigationController: UINavigationController,
         storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)) {
        self.navigationController = navigationController
        self.storyboard = storyboard
    }
    
    func navigate(to destination: AuthFlow) {
        navPath.append(destination)
        
        let viewController: UIViewController = storyboard.instantiateViewController(
            withIdentifier: destination.rawValue
        )
        viewController.restorationIdentifier = destination.rawValue // ✅ add this

        // Inject router into the view controller
        if let routableVC = viewController as? Routable {
            routableVC.router = self
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateBack() {
        guard !navPath.isEmpty else { return }
        navPath.removeLast()
        navigationController?.popViewController(animated: true)
    }
    
    func popToRoot() {
        navPath.removeAll()
        navigationController?.popToRootViewController(animated: true)
    }
    
    // New method to navigate to specific view controller
    func navigateToSpecificViewController(_ destination: AuthFlow) {
        guard let navController = navigationController else {
            return
        }

        // Check if the desired VC already exists in the stack
        for (index, vc) in navController.viewControllers.enumerated() {
            if vc.restorationIdentifier == destination.rawValue {
                navController.popToViewController(vc, animated: true)

                // 🧠 Sync navPath with actual nav stack
                navPath = navController.viewControllers.compactMap {
                    AuthFlow(rawValue: $0.restorationIdentifier ?? "")
                }
                return
            }
        }
        navigate(to: destination)
    }

}

protocol Routable: AnyObject {
    var router: Router? { get set }
}
