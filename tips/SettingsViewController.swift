//
//  SettingsViewController.swift
//  tips
//
//  Created by Clayton Petty on 12/10/15.
//  Copyright (c) 2015 Clayton Petty. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var minTipField: UITextField!
    @IBOutlet weak var maxTipField: UITextField!
    @IBOutlet weak var defaultTipField: UITextField!
    @IBOutlet weak var memoryField: UITextField!
    @IBOutlet weak var minTipView: UIView!
    @IBOutlet weak var maxTipView: UIView!
    @IBOutlet weak var defaultTipView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        minTipField.text = "\(minTip)"
        maxTipField.text = "\(maxTip)"
        defaultTipField.text = "\(defaultTip)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func minTipChanged(sender: AnyObject) {

        let defaults = NSUserDefaults.standardUserDefaults()
        var minTip = NSString(string: minTipField.text!).intValue
        defaults.setInteger(Int(minTip), forKey: "minTip")
    }
    
    @IBAction func maxTipChanged(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var maxTip = NSString(string: maxTipField.text!).intValue
        defaults.setInteger(Int(maxTip), forKey: "maxTip")
    }
    
    @IBAction func defaultTipChanged(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = NSString(string: defaultTipField.text!).intValue
        defaults.setInteger(Int(defaultTip), forKey: "defaultTip")
    }
    
    @IBAction func editedField(sender: AnyObject) {
        self.minTipView.frame = CGRectMake( 0, 50, 350, 100 );
        self.maxTipView.frame = CGRectMake( 0, 150, 350, 100 );
        self.defaultTipView.frame = CGRectMake( 0, 250, 350, 100 );
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
//        UIView.animateWithDuration(0.3, animations: {
//            self.
//        })
        
        UIView.animateWithDuration(1.0, animations: {
//            self.minTipView.frame.size.height = 150
            self.minTipView.frame = CGRectMake( 0, 50, 350, 150 );
            self.maxTipView.frame = CGRectMake( 0, 200, 350, 150 );
            self.defaultTipView.frame = CGRectMake( 0, 350, 350, 150 );
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
