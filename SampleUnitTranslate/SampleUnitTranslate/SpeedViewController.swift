import UIKit

class SpeedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let speedunit = ["m/s","km/h","km/s","mach","in/s","mile/h"]
    let speedkey = [1.0,3.6,0.001,0.0029386,39.370079,2.236936]
    
    var fromindex = 0
    var toindex = 0
    var fromvalue = 0.0
    var tovalue = 0.0
    var vaild = false
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return speedunit.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return speedunit[row]
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
            tovalue = (input/speedkey[fromindex])*speedkey[toindex]
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
        let from = "speed"
        UserDefaults.standard.set(from, forKey: "from")
        performSegue(withIdentifier: "gototableview", sender: self)
    }
    
    @IBAction func SaveData(_ sender: Any) {
        print(vaild)
        if vaild {
            var items : [String]
            let SavedLength = UserDefaults.standard.object(forKey: "speed")
            if let temp = SavedLength as? [String] {
                items = temp
                items.append(inputvalue.text! + "  " + String(speedunit[fromindex]) + "  " + outputvalue.text! + "  " + String(speedunit[toindex]))
                vaild = false
            }else{
                items = [inputvalue.text! + "  " + String(speedunit[fromindex]) + "  " + outputvalue.text! + "  " + String(speedunit[toindex])]
            }
            UserDefaults.standard.set(items, forKey: "speed")
            
        }
    }

}
