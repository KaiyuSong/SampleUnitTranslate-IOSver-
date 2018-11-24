
import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var head: UILabel!
    
    
    var values : [String]!
    var from : String!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = values[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
        tableView.reloadData()
    }
    
    func loadData() {
        let SavedPosition = UserDefaults.standard.object(forKey: "from")
        if let temp = SavedPosition as? String {
            from = temp
        }
        switch from {
        case "length":
            head.text = "Length Values"
            let SavedLength = UserDefaults.standard.object(forKey: "length")
            if let temp = SavedLength as? [String] {
                values = temp
            }else{
                print("Try other")
            }
        case "area":
            head.text = "Area Values"
            let SavedLength = UserDefaults.standard.object(forKey: "area")
            if let temp = SavedLength as? [String] {
                values = temp
            }else{
                print("Try other")
            }
        case "volume":
            head.text = "Volume Values"
            let SavedLength = UserDefaults.standard.object(forKey: "volume")
            if let temp = SavedLength as? [String] {
                values = temp
            }else{
                print("Try other")
            }
        case "speed":
            head.text = "Speed Values"
            let SavedLength = UserDefaults.standard.object(forKey: "speed")
            if let temp = SavedLength as? [String] {
                values = temp
            }else{
                print("Try other")
            }
        case "temperature":
            head.text = "Temperature Values"
            let SavedLength = UserDefaults.standard.object(forKey: "temperature")
            if let temp = SavedLength as? [String] {
                values = temp
            }else{
                print("Try other")
            }
        case "energy":
            head.text = "Energy Values"
            let SavedLength = UserDefaults.standard.object(forKey: "energy")
            if let temp = SavedLength as? [String] {
                values = temp
            }else{
                print("Try other")
            }
        default:
            print("Error")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            values.remove(at: indexPath.row)
            print("get it")
            tableView.reloadData()
            switch from {
            case "length":
                UserDefaults.standard.set(values, forKey: "length")
            case "area":
                UserDefaults.standard.set(values, forKey: "area")
            case "volume":
                UserDefaults.standard.set(values, forKey: "volume")
            case "speed":
                UserDefaults.standard.set(values, forKey: "speed")
            case "temperature":
                UserDefaults.standard.set(values, forKey: "temperature")
            case "energy":
                UserDefaults.standard.set(values, forKey: "energy")
            default:
                print("No where to go")
            }
        }
    }
    
    @IBAction func goToMainPage(_ sender: Any) {
//        performSegue(withIdentifier: "gotomainpage", sender: self)
    }
    
    @IBAction func goToPreviousPage(_ sender: Any) {
        switch from {
        case "length":
            performSegue(withIdentifier: "gotolength", sender: self)
        case "area":
            performSegue(withIdentifier: "gotoarea", sender: self)
        case "volume":
            performSegue(withIdentifier: "gotovolume", sender: self)
        case "speed":
            performSegue(withIdentifier: "gotospeed", sender: self)
        case "temperature":
            performSegue(withIdentifier: "gototemperature", sender: self)
        case "energy":
            performSegue(withIdentifier: "gotoenergy", sender: self)
        default:
            print("No where to go")
        }
    }
    
}
