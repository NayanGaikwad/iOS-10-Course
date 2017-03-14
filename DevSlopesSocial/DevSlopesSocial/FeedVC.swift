//
//  FeedVC.swift
//  DevSlopesSocial
//
//  Created by Arpita Bhatia on 3/9/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func signOutTapped(_ sender: Any) {
        
        let keyChainResult = KeychainWrapper.standard.remove(key: KEY_UID)
        print("AB: Id removed from keychain \(keyChainResult)")
        try! FIRAuth.auth()?.signOut()
        //delete the following as it creates strong references
        //performSegue(withIdentifier: "goToSignIn", sender: nil)
        
        //instead use this
        dismiss(animated: true, completion: nil)
    }

   

}
