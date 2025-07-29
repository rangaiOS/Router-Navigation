import UIKit

class EmailSentViewController: UIViewController, Routable {
    var router: Router?
    
    @IBAction func loginLaterTapped(_ sender: UIButton) {
        router?.popToRoot()
    }
    
    
    @IBAction func profileTapped(_ sender: UIButton) {
        router?.navigate(to: .profile)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restorationIdentifier = Router.AuthFlow.emailSent.rawValue // Optional, but helpful
    }
}
