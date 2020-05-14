//
//  LoginViewController.swift
//  Noti
//
//  Created by Chris Jol on 5/9/20.
//  Copyright © 2020 Joui. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func loginPressed(_ sender: Any) {
    if let email = userField.text, let password = passwordField.text{
      Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
        if let err = error {
          print(err.localizedDescription)
        } else {
          self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
      }
    }
  }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: true)
  }
}
