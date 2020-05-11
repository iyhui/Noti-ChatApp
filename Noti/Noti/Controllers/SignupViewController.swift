//
//  SignupViewController.swift
//  Noti
//
//  Created by Chris Jol on 5/9/20.
//  Copyright © 2020 Joui. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: true)
  }


}
