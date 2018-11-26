import UIKit

class Temperature_ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let temperatureunit = ["K","°C","°F","°R"]
//    let temperaturekey = [1.0,0.001,10.0,100.0,1000.0,1000000.0,1000000000.0,39.3700787,0.0006213711922373,3.280839895013,1.093613298338]
    let key = 0.5555555555555555556
    
    
    var fromindex = 0
    var toindex = 0
    var fromvalue = 0.0
    var tovalue = 0.0
    var vaild = false
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureunit.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return temperatureunit[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == frompick {
            fromindex = row
        }
        if pickerView == topick {
            toindex = row
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frompick.delegate = self
        frompick.dataSource = self
        topick.delegate = self
        topick.dataSource = self
    }
    
    @IBOutlet weak var frompick: UIPickerView!
    @IBOutlet weak var topick: UIPickerView!
    @IBOutlet weak var inputvalue: UITextField!
    @IBOutlet weak var outputvalue: UILabel!
    
    @IBAction func calculate(_ sender: Any) {
        if let input = Double(inputvalue.text!) {
            var value = input
//            let key = 0.5555555555555555556
            switch fromindex {
            case 0:
                break
            case 1:
                value = value + 273.15
            case 2:
                value = (value+459.67)*key
            case 3:
                value = value*key
            default:
                print("Error")
            }
//            print("\(value)")
            switch toindex {
            case 0:
                tovalue = value
            case 1:
                tovalue = value - 273.15
            case 2:
                tovalue = (value/key)-459.67
            case 3:
                tovalue = value/key
            default:
                print("Error")
            }
            outputvalue.text = String(tovalue)
            vaild = true
        } else {
            print("Not a valid number: \(inputvalue.text!)")
            vaild = false
        }
    }
    
    @IBAction func goback(_ sender: Any) {
                performSegue(withIdentifier: "goback", sender: self)
    }
    
    
    @IBAction func gotoableview(_ sender: Any) {
        let from = "temperature"
        UserDefaults.standard.set(from, forKey: "from")
        performSegue(withIdentifier: "gototableview", sender: self)
    }
    
    @IBAction func SaveData(_ sender: Any) {
        print(vaild)
        if vaild {
            var items : [String]
            let SavedLength = UserDefaults.standard.object(forKey: "temperature")
            if let temp = SavedLength as? [String] {
                items = temp
                items.append(inputvalue.text! + "  " + String(temperatureunit[fromindex]) + "  " + outputvalue.text! + "  " + String(temperatureunit[toindex]))
                vaild = false
            }else{
                items = [inputvalue.text! + "  " + String(temperatureunit[fromindex]) + "  " + outputvalue.text! + "  " + String(temperatureunit[toindex])]
            }
            UserDefaults.standard.set(items, forKey: "temperature")
            
        }
    }
    
    
}
