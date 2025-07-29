//
import UIKit

class ForgotPasswordViewController: UIViewController, Routable {
    var router: Router?
    
    @IBAction func sendInstructionsTapped(_ sender: UIButton) {
        router?.navigate(to: .emailSent)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restorationIdentifier = Router.AuthFlow.forgotPassword.rawValue // Optional, but helpful

    }
}
