import UIKit

class LengthViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let colors = ["Red","Yellow","Green","Blue","A","B","C","D"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        testpicker.delegate = self
        testpicker.dataSource = self
    }
    
    @IBOutlet weak var testpicker: UIPickerView!
    
    
    
}
