//
//  ViewController.swift
//  Prework
//
//  Created by Christian Pinto on 8/10/21.
//

import UIKit

class TipViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        //deselect tipControl segments
        tipControl.selectedSegmentIndex = UISegmentedControl.noSegment
        
        //clear previous data
        billAmountTextField.text = ""
        tipAmountLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        // Retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let firstTip = defaults.string(forKey: "firstTip") ?? "firstTip"
        let secondTip = defaults.string(forKey: "secondTip") ?? "secondTip"
        let thirdTip = defaults.string(forKey: "thirdTip") ?? "thirdTip"
        tipControl.setTitle(firstTip, forSegmentAt: 0)
        tipControl.setTitle(secondTip, forSegmentAt: 1)
        tipControl.setTitle(thirdTip, forSegmentAt: 2)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get Total tip my multiplying bill * tipPercentage
        let tipPercentages = [Double((tipControl.titleForSegment(at: 0)?.dropLast())!), Double((tipControl.titleForSegment(at: 1)?.dropLast())!), Double((tipControl.titleForSegment(at: 2)?.dropLast())!)]
        let tip = 0.01 * bill * tipPercentages[tipControl.selectedSegmentIndex]!
        let total = bill + tip
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
}

