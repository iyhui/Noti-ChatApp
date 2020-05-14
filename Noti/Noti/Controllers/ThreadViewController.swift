//
//  ThreadViewController.swift
//  Noti
//
//  Created by Chris Jol on 5/9/20.
//  Copyright © 2020 Joui. All rights reserved.
//

import UIKit
import Firebase

class ThreadViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func logoutBpressed(_ sender: UIBarButtonItem) {
    let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        
      navigationController?.popToRootViewController(animated: true)
            
    } catch let signOutError as NSError {
        print ("Error signing out: %@", signOutError)
    }
  }
}

