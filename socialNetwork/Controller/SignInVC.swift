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

class SignInVC: UIViewController {

    @IBOutlet weak var fbButton: RoundBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func fbButtonPressed(_ sender: Any) {
        let fbLogin = FBSDKLoginManager()
        print("logging in facebook")
        fbLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Donna: Unable to authenticate with Facebook: \(error)")
            }else if result?.isCancelled == true{
                print("Donna: User cancelled Facebook Authentication")
            }else{
                print("Donna: Authenticated successfully on Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.fireBaseAuth(credential)
            }
        }
        
    }
    
    func fireBaseAuth(_ credential: AuthCredential){
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("Donna: Unable to authenticate  with FireBase:\(error.debugDescription)")
            } else  {
                print("Donna: Authenticated successfully on Firebase")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

