//
//  FeedVC.swift
//  devslopes-social
//
//  Created by Willie Fatimehin on 3/9/17.
//  Copyright © 2017 Opia. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //listener
        
        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            print(snapshot.value)
        })
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        //removes stored keychain
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print(" ID removed from keychain \(keychainResult)")
        //signout of firebase
        try! FIRAuth.auth()?.signOut()
        
        performSegue(withIdentifier: "goToSignIn " , sender: nil)
    }

}
