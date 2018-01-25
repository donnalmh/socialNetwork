//
//  ViewController.swift
//  socialNetwork
//
//  Created by Donna Samuel on 19/1/18.
//  Copyright © 2018 donnasamuel. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!
    @IBOutlet weak var fbButton: RoundBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID)
        {
            print("Donna: ID found in keychain")
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }

    @IBAction func fbButtonPressed(_ sender: Any) {
        let fbLogin = FBSDKLoginManager()
        print("logging in facebook")
        fbLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Donna: Unable to authenticate with Facebook: \(error.debugDescription)")
            }else if result?.isCancelled == true{
                print("Donna: User cancelled Facebook Authentication")
            }else{
                print("Donna: Authenticated successfully on Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.fireBaseAuth(credential)
            }
        }
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text,let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("Donna: Authenticated successfully on Firebase through email")
                    if let user = user{
                        self.completeSignIn(id: user.uid)
                    }
                }else if error != nil{
                    //If no such user, create user
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error == nil {
                            print("Created user successfully")
                        }else{
                            print("Failed to create user. Try again.")
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String){
        KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("Data saved to keychain")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
    
    func fireBaseAuth(_ credential: AuthCredential){
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("Donna: Unable to authenticate  with FireBase:\(error.debugDescription)")
            } else  {
                print("Donna: Authenticated successfully on Firebase")
                if let user = user{
                    self.completeSignIn(id: user.uid)
                    
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

