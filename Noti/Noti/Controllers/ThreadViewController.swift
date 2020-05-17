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

    @IBOutlet weak var messageText: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    messageText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: messageText.frame.height))
    messageText.leftViewMode = .always
    
    messageTableView.dataSource =  self
    
    navigationItem.hidesBackButton = true
    
    messageTableView.register(UINib(nibName: "mCell", bundle: nil), forCellReuseIdentifier: "threadCell")
    
    messageLoad()
    
  }
    
    func messageLoad(){
       
        db.collection("messages").order(by: "date").addSnapshotListener { (querySnapshot, err) in
            
            self.messages = []
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let user = data["user"] as? String, let messageBody = data["body"] as? String {
                            let newMessage = Message(user: user, body: messageBody)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                self.messageTableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count  - 1, section: 0)
                                self.messageTableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }

    @IBAction func sendPressed(_ sender: UIButton) {
            if let messageBody = messageText.text, let messageSender = Auth.auth().currentUser?.email{
                
                db.collection("messages").addDocument(data: [
                    "user": messageSender,
                    "body": messageBody,
                    "date": Date().timeIntervalSince1970
                ]) { (error) in
                    if let err = error {
                        print("Current error: \(err)")
                    } else {
                        print("Stored")
                        DispatchQueue.main.async{
                            self.messageText.text = " "
                        }
                    }
            }
            
        }
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

extension ThreadViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        let cell = messageTableView.dequeueReusableCell(withIdentifier: "threadCell", for: indexPath) as! mCell
        cell.label.text = message.body
        
        if message.user == Auth.auth().currentUser?.email{
            cell.leftImage.isHidden = true
            cell.rightImage.isHidden = false
            cell.bubble.backgroundColor = UIColor(red: 0.63, green: 0.83, blue: 0.79, alpha: 1.00)
            
        }
        else{
            cell.leftImage.isHidden = false
            cell.rightImage.isHidden = true
            
             cell.bubble.backgroundColor = UIColor(red: 0.16, green: 0.65, blue: 0.57, alpha: 1.00)
        }
        
        
        return cell
    }
    
    
    
}
