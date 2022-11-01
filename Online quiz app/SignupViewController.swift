//
//  SignupViewController.swift
//  Online quiz app
//
//  Created by kuet on 2/11/21.
//  Copyright © 2021 kuet. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupViewController: UIViewController {

    @IBOutlet weak var alert: UILabel!
    @IBOutlet weak var confirmPass: UITextField!
    @IBOutlet weak var semail: UITextField!
    @IBOutlet weak var spassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupfunc(_ sender: Any) {
        if semail.text?.isEmpty == true {
            self.alert.text="No email"
            return
        }
        if spassword.text?.isEmpty == true {
            self.alert.text="empty password"
            return
        }
        if confirmPass.text?.isEmpty == true {
            self.alert.text="empty confirm password"
            return
        }
        if confirmPass.text == spassword.text{
    
            signup()
            
        }
        else{
            self.alert.text="Password not matched"
        }
    }
    
    
    func signup(){
        Auth.auth().createUser(withEmail: semail.text!, password: spassword.text! ){
            (authResult,error ) in
            guard let user=authResult?.user,error==nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
   

}
