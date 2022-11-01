//
//  LoginViewController.swift
//  Online quiz app
//
//  Created by kuet on 2/11/21.
//  Copyright © 2021 kuet. All rights reserved.
//

import UIKit
import FirebaseAuth

import Firebase


class LoginViewController: UIViewController {

    @IBOutlet weak var alert: UILabel!
    @IBOutlet weak var lemail: UITextField!
    @IBOutlet weak var lpassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginfunc(_ sender: Any) {
        validateFields()
    }
    func validateFields() {
        if lemail.text?.isEmpty == true {
            self.alert.text = "No email in the email"
            return
        }
            
            if lpassword.text?.isEmpty == true {
                self.alert.text = "Empty password"
                return
            }
        
        login()
    }

    func login(){
        Auth.auth().signIn(withEmail: lemail.text!, password: lpassword.text! ){
            [weak self] authResult, err in
            guard let strongSelf = self else  {
               return
            }
            if let err = err {
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
            
        } 
    
    }
    func checkUserInfo(){
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Home")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
            
        }
    }
}
