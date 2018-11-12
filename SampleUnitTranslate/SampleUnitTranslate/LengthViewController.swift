import UIKit

class LengthViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let lengthunit = ["m","km","dm","cm","mm","µm","nm","in","mi","ft","yd"]
    let lengthkey = [1.0,0.001,10.0,100.0,1000.0,1000000.0,1000000000.0,39.3700787,0.0006213711922373,3.280839895013,1.093613298338]
    
    var fromindex = 0
    var toindex = 0
    var fromvalue = 0.0
    var tovalue = 0.0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lengthunit.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lengthunit[row]
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
            tovalue = (input/lengthkey[fromindex])*lengthkey[toindex]
            outputvalue.text = String(tovalue)
        } else {
            print("Not a valid number: \(inputvalue.text!)")
        }
    }
    
    @IBAction func goback(_ sender: Any) {
        performSegue(withIdentifier: "goback", sender: self)
    }
    
    
    @IBAction func gotableview(_ sender: Any) {
        performSegue(withIdentifier: "gototableview", sender: self)
    }
    
    @IBAction func SaveData(_ sender: Any) {
        var items : [String]
        let SavedLength = UserDefaults.standard.object(forKey: "length")
        if let temp = SavedLength as? [String] {
            items = temp
            items.append(inputvalue.text! + "  " + String(lengthunit[fromindex]) + "  " + outputvalue.text! + "  " + String(lengthunit[toindex]))
            
        }else{
            items = [inputvalue.text! + "  " + String(lengthunit[fromindex]) + "  " + outputvalue.text! + "  " + String(lengthunit[toindex])]
        }
        print(items)
        
        UserDefaults.standard.set(items, forKey: "length")
        
    }
    
    
}
