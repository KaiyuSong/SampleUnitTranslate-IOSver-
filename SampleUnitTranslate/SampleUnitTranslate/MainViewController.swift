import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var items : [String]
        let SavedL = UserDefaults.standard.object(forKey: "length")
        if let temp = SavedL as? [String] {
            items = temp
        }else{
            items = []
        }
        UserDefaults.standard.set(items, forKey: "length")
        
        let SavedA = UserDefaults.standard.object(forKey: "area")
        if let temp = SavedA as? [String] {
            items = temp
        }else{
            items = []
        }
        UserDefaults.standard.set(items, forKey: "area")
        
        let SavedV = UserDefaults.standard.object(forKey: "volume")
        if let temp = SavedV as? [String] {
            items = temp
        }else{
            items = []
        }
        UserDefaults.standard.set(items, forKey: "volume")
        
        let SavedS = UserDefaults.standard.object(forKey: "speed")
        if let temp = SavedS as? [String] {
            items = temp
        }else{
            items = []
        }
        UserDefaults.standard.set(items, forKey: "speed")
        
        let SavedT = UserDefaults.standard.object(forKey: "temperature")
        if let temp = SavedT as? [String] {
            items = temp
        }else{
            items = []
        }
        UserDefaults.standard.set(items, forKey: "temperature")
        
        let SavedE = UserDefaults.standard.object(forKey: "energy")
        if let temp = SavedE as? [String] {
            items = temp
        }else{
            items = []
        }
        UserDefaults.standard.set(items, forKey: "energy")

    }
    
    @IBAction func length(_ sender: Any) {
        performSegue(withIdentifier: "gotolength", sender: self)
    }
    
    @IBAction func area(_ sender: Any) {
        performSegue(withIdentifier: "gotoarea", sender: self)
    }
    
    @IBAction func volume(_ sender: Any) {
        performSegue(withIdentifier: "gotovolume", sender: self)
    }
    
    @IBAction func speed(_ sender: Any) {
        performSegue(withIdentifier: "gotospeed", sender: self)
    }
    
    @IBAction func temperature(_ sender: Any) {
        performSegue(withIdentifier: "gototemperature", sender: self)
    }
    
    @IBAction func energy(_ sender: Any) {
        performSegue(withIdentifier: "gotoenergy", sender: self)
    }

}
