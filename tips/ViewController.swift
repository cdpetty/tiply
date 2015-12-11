//
//  ViewController.swift
//  tips
//
//  Created by Clayton Petty on 12/10/15.
//  Copyright (c) 2015 Clayton Petty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var minTip = defaults.integerForKey("minTip")
        var maxTip = defaults.integerForKey("maxTip")
        var defaultTip = defaults.integerForKey("defaultTip")
        var previousAmount = defaults.floatForKey("billAmount")
        if (minTip == 0){
            minTip = 10
        }
        if (maxTip == 0){
            maxTip = 30
        }
        if (defaultTip == 0){
            defaultTip = 20
        }
        tipSlider.minimumValue = Float(minTip)
        tipSlider.maximumValue = Float(maxTip)
        tipSlider.value = Float(defaultTip)
        tipPercentageLabel.text = "\(defaultTip)"
        var d = defaults.objectForKey("time");// as! NSDate
        println(d)
        if (d != nil){
            var oldDate = d as! NSDate
            if (previousAmount != 0){
                if (oldDate.timeIntervalSinceDate(NSDate()) < 600){
                    amountField.text = "\(previousAmount)"
                    onEditingChanged(amountField)
                }
            }
        }
        amountField?.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var minTip = defaults.integerForKey("minTip")
        var maxTip = defaults.integerForKey("maxTip")
        var defaultTip = defaults.integerForKey("defaultTip")
        if (minTip == 0){
            minTip = 10
        }
        if (maxTip == 0){
            maxTip = 30
        }
        if (defaultTip == 0){
            defaultTip = 20
        }
        tipSlider.minimumValue = Float(minTip)
        tipSlider.maximumValue = Float(maxTip)
        tipSlider.value = Float(defaultTip)
        tipPercentageLabel.text = "%\(defaultTip)"
        onEditingChanged(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = NSString(string: amountField.text!).doubleValue
        var tip = Int(tipSlider.value)
        var tipAmount = (Float(tip) / 100.0) * Float(billAmount)
        var total = tipAmount + Float(billAmount)
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(Float(billAmount), forKey: "billAmount")
        defaults.setObject(NSDate(), forKey: "time")

    }
    
    @IBAction func sliderChanged(sender: AnyObject) {
        var tip = Int(tipSlider.value)
        tipPercentageLabel.text = "%\(tip)"
        onEditingChanged(sender)
    }
    
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)

    }
    

}

