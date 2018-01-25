//
//  FeedVCViewController.swift
//  socialNetwork
//
//  Created by Donna Samuel on 25/1/18.
//  Copyright © 2018 donnasamuel. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVCViewController: UIViewController {

    @IBAction func signOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("Donna: ID removed from keychain")
        
        
        try! Auth.auth().signOut()
        
        performSegue(withIdentifier: "goToSignIn", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
