//
//  ViewController.swift
//  Calcutip
//
//  Created by He Zhang on 1/21/17.
//  Copyright © 2017 He Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var calculationView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var partyLabel: UILabel!

    
    var partyNumber: Int = 1
    
    //  Define UIStepper value and have it be an integer for later calculation.
    @IBAction func partyStepper(_ sender: UIStepper) {
        partyNumber = Int(sender.value)
        partyLabel.text = "\(partyNumber)"
        calculateTip(sender)
    }
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    self.calculationView.alpha = 0
    
    billField.becomeFirstResponder()
    
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //  Page gesture triger keyboard
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)

    }
 
 

    //  Calculate tip here and devide individual total if people needs to split the bill.
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        // Need to remove the $ from the text field
        let billString = billField.text!
        let billNoDollar = billString.replacingOccurrences(of: "$", with: "")
        
        let bill = Double(billNoDollar) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        //let total = bill + tip
        let total = (bill + tip) / Double(partyNumber)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

        
        UIView.animate(withDuration: 0.5) {
            self.calculationView.alpha = 1
            self.calculationView.center = CGPoint (x:187.5, y:440)
        }
        
    }

}

