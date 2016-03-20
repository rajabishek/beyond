//
//  LoginViewController.swift
//  Beyond
//
//  Created by Raj Abishek on 20/03/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit
import Spring

class LoginViewController: UIViewController {

    @IBOutlet weak var errorMessageTextLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageTextLabel.text = ""
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonWasPressed(sender: AnyObject) {
        
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
