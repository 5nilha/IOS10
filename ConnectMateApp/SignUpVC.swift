//
//  SignUpVC.swift
//  ConnectMateApp
//
//  Created by Fabio Quintanilha on 12/18/16.
//  Copyright © 2016 Studio. All rights reserved.
//

import UIKit
import Firebase


class SignUpVC: UIViewController {

    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
            print("DEVELOPER: We are trying to create a user")
            if error != nil{
                print("DEVELOPER: we have an error \(error)")
            } else{
                
                print("DEVELOPER: User create with success")
                

                FIRDatabase.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email!)
                FIRDatabase.database().reference().child("users").child(user!.uid).child("fullname").setValue(self.fullnameTextField.text!)
                
                self.performSegue(withIdentifier: "homesegue2", sender: nil)
                
            }
        })
    }


}
