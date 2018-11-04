import UIKit
//main view controller
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func lengthbuttontouch(_ sender: UIButton) {
        performSegue(withIdentifier: "gotolengthview", sender: self)
    }
    
}

