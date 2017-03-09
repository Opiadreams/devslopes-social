//
//  ViewController.swift
//  devslopes-social
//
//  Created by Willie Fatimehin on 3/4/17.
//  Copyright © 2017 Opia. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var pwdField: FancyField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func FacebookBtnTapped(_ sender: AnyObject) {
        
        //authenticate with facebook
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Unable to authenticate with Facebook - \(error)")
            } else if  result?.isCancelled == true {
                print("User cancelled Facebook authentication")
            } else {
                print("Successfully authenticated with Facebook")
                //get credntial from facebook the create with access token and use current token string of the access string
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                //call method
                self.firebaseAuth(credential)
            }
            
        }
        
    }
    
    //autheticate with firebase
    
    func firebaseAuth(_ credential: FIRAuthCredential ) {
        //main line to aunthentcate
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Unable to auntheticate with firebase - \(error)")
            } else {
                print("Successfully authenticated with Firebase")
                KeychainWrapper.set
            }
        })
    }
    
    @IBAction func signInTapped(_ sender: AnyObject) {
        
        if let email = emailField.text, let pwd = pwdField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if  error == nil {
                    print("Email user authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Unable to authenticate with Firebase using email \(error)")
                        } else {
                            print("Successfully authenticated with Firebase")
                        }
                    })
                }
                
            })
        }
    }
    

}

