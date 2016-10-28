//
//  LoginViewController.swift
//  ParseClient
//
//  Created by Akifumi Shinagawa on 10/27/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
 
    
    var alertController:UIAlertController!
    

    
    @IBAction func onLogIn(_ sender: AnyObject) {
    
    
        
        
//        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!)
        
        
        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!, block: {
            (user: PFUser?, error: Error?) -> Void in
            if let error = error {
                //let errorString = error.userInfo["error"] as? String
                //                let errorString = error.userInfo["error"] as! NSErro
                
                print("Login error --------->>")
                print(error)
                
                
                self.present(self.alertController, animated: true) {
                    
                    print("login alert closed")
                    
                }
                
                // Show the errorString somewhere and let the user try again.
            } else {
                
                print("Login Succsess --- ")
                self.performSegue(withIdentifier: "loginSegue", sender: self)
                // Hooray! Let them use the app now.
            }
        })
        
        
        
    }
    
    
    
    

    
    
    
    @IBAction func onSignUp(_ sender: AnyObject) {
        
        let user = PFUser()
        user.username = emailTextField.text
        user.password = passwordTextField.text
//        user.email = emailTextField.text
        
        // other fields can be set just like with PFObject
        //user["phone"] = "415-392-0202"
        
        
        user.signUpInBackground(block: {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                //let errorString = error.userInfo["error"] as? String
//                let errorString = error.userInfo["error"] as! NSErro
                
                print("--------->>")
                print(error)
                
                
                self.present(self.alertController, animated: true) {

                    print("alert closed")
                    
                }
                
                // Show the errorString somewhere and let the user try again.
            } else {
                
                print("Succsess --- ")
                
                self.performSegue(withIdentifier: "loginSegue", sender: self)
                // Hooray! Let them use the app now.
            }
        })
        

        

  

        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        alertController = UIAlertController(title: "Singup Failed", message: "Soemthing went wrong!", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
            print(" cancel tapped ---> ")
            
        }
        
        alertController.addAction(cancelAction)
        
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

