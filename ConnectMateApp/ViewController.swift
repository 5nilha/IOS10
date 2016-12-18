//
//  ViewController.swift
//  ConnectMateApp
//
//  Created by Fabio Quintanilha on 12/18/16.
//  Copyright © 2016 Studio. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   
    @IBAction func signInButtonTapped(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("DEVELOPER: Trying to Sign In")
            if error != nil {
                print("DEVELOPER: We have an error: \(error)")
            } else {
                print("DEVELOPER: Signed In Successfully")
                self.performSegue(withIdentifier: "homeSegue", sender: nil)
            }
        })
        
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }

    
    
}

