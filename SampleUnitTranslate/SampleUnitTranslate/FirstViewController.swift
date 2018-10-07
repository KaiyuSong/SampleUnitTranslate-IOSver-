import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var Test: UILabel!
    
    
    @IBAction func Change(_ sender: UIButton) {
        Test.text = "Success"
    }
}

