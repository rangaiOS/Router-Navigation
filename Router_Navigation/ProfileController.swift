import UIKit

class ProfileViewController: UIViewController, Routable {
    var router: Router?

    @IBAction func resetPasswordTapped(_ sender: UIButton) {
        print("[ProfileVC] Reset password tapped. Trying to navigate to ForgotPassword.")
        router?.navigateToSpecificViewController(.forgotPassword)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        restorationIdentifier = Router.AuthFlow.profile.rawValue // Optional, but helpful
        print("[ProfileVC] Loaded with restorationIdentifier: \(restorationIdentifier ?? "nil")")
    }
}
