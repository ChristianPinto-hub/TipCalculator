//
//  SettingsViewController.swift
//  Prework
//
//  Created by Christian Pinto on 8/12/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var firstTipTextField: UITextField!
    @IBOutlet weak var secondTipTextField: UITextField!
    @IBOutlet weak var thirdTipTextField: UITextField!
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setTips(_ sender: Any) {
        
        let firstTip = String(firstTipTextField.text!)
        let secondTip = String(secondTipTextField.text!)
        let thirdTip = String(thirdTipTextField.text!)
        
        defaults.set(firstTip, forKey: "firstTip")
        defaults.set(secondTip, forKey: "secondTip")
        defaults.set(thirdTip, forKey: "thirdTip")
        
        defaults.synchronize()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
