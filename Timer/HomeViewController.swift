//
//  HomeViewController.swift
//  Timer
//
//  Created by Anson Ciurcovich on 2016-03-08.
//  Copyright © 2016 Anson Ciurcovich. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var timeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        timeTextField.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueTimer") {
            let svc = segue.destinationViewController as! ViewController;
            
            svc.toPass = timeTextField.text
            
        }
    }
    

}
