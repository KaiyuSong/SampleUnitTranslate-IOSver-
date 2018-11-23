
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
        default:
            print("Error")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            values.remove(at: indexPath.row)
            print("get it")
            tableView.reloadData()
            UserDefaults.standard.set(values, forKey: "length")
        }
    }
    
    @IBAction func goToMainPage(_ sender: Any) {
        performSegue(withIdentifier: "gotomainpage", sender: self)
    }
    
    @IBAction func goToPreviousPage(_ sender: Any) {
        switch from {
        case "length":
            performSegue(withIdentifier: "gotolength", sender: self)
        default:
            print("No where to go")
        }
    }
    
}
