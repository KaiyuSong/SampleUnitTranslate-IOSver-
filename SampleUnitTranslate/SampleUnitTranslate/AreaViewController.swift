import UIKit

class AreaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let areaunit = ["m²","km²","dm²","cm²","in²","ft²","yd²","ha"]
    let areakey = [1.0,0.000001,100.0,10000.0,1550.00310001,10.76391041671,1.195990046301,0.0001]
    
    var fromindex = 0
    var toindex = 0
    var fromvalue = 0.0
    var tovalue = 0.0
    var vaild = false
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return areaunit.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return areaunit[row]
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
        print("get")
        super.viewDidLoad()
    }
    
    @IBOutlet weak var frompick: UIPickerView!
    @IBOutlet weak var topick: UIPickerView!
    @IBOutlet weak var inputvalue: UITextField!
    @IBOutlet weak var outputvalue: UILabel!
    
    @IBAction func calculate(_ sender: Any) {
        if let input = Double(inputvalue.text!) {
            tovalue = (input/areakey[fromindex])*areakey[toindex]
            outputvalue.text = String(tovalue)
            vaild = true
        } else {
            print("Not a valid number: \(inputvalue.text!)")
            vaild = false
        }
    }
    
    
    
}
