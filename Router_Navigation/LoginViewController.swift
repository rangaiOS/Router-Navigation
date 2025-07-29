import UIKit

class LoginViewController: UIViewController, Routable {
    var router: Router?
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        router?.navigate(to: .forgotPassword)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restorationIdentifier = Router.AuthFlow.login.rawValue // Optional, but helpful
    }
}
