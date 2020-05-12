//
//  WelcomeViewController.swift
//  Noti
//
//  Created by Chris Jol on 5/9/20.
//  Copyright © 2020 Joui. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func LoginButton(_ sender: Any) {
  }
  
  @IBAction func SignupButton(_ sender: Any) {
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    
    var charIndex = 0.0
    titleLabel.text = ""
    let titleText = "Noti"
    for letter in titleText {
        Timer.scheduledTimer(withTimeInterval: 0.4 * charIndex, repeats: false) {(timer) in
            self.titleLabel.text?.append(letter)
        }
        charIndex += 1
    }
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }


}
