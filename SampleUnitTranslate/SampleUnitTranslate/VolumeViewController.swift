import UIKit

class VolumeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let volumeunit = ["m³","l(dm³)","cm³","mm³","us gal","us oz"]
    let volumekey = [1.0,1000.0,1000000.0,1000000000.0,264.1720524,34164.6737274]
    
    var fromindex = 0
    var toindex = 0
    var fromvalue = 0.0
    var tovalue = 0.0
    var vaild = false
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return volumeunit.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return volumeunit[row]
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
            tovalue = (input/volumekey[fromindex])*volumekey[toindex]
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
        let from = "volume"
        UserDefaults.standard.set(from, forKey: "from")
        performSegue(withIdentifier: "gototableview", sender: self)
    }
    
    @IBAction func SaveData(_ sender: Any) {
        print(vaild)
        if vaild {
            var items : [String]
            let SavedLength = UserDefaults.standard.object(forKey: "volume")
            if let temp = SavedLength as? [String] {
                items = temp
                items.append(inputvalue.text! + "  " + String(volumeunit[fromindex]) + "  " + outputvalue.text! + "  " + String(volumeunit[toindex]))
                vaild = false
            }else{
                items = [inputvalue.text! + "  " + String(volumeunit[fromindex]) + "  " + outputvalue.text! + "  " + String(volumeunit[toindex])]
            }
            UserDefaults.standard.set(items, forKey: "volume")
            
        }
    }

}
