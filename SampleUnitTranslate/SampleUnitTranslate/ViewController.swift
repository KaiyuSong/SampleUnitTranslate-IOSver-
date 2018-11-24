import UIKit
//main view controller
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func length(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoareaview", sender: self)
    }
    
}
