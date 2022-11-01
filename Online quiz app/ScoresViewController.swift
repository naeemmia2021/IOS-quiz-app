//
//  ScoresViewController.swift
//  Online quiz app
//
//  Created by kuet on 4/11/21.
//  Copyright © 2021 kuet. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ScoresViewController: UIViewController {

    @IBOutlet weak var performance: UILabel!
    @IBOutlet weak var score: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference()

        ref.child("score").observeSingleEvent(of: .value) {(snapshot) in
        let val = snapshot.value as? NSDictionary
            
            let hscore = val?["lastscore"] as? String
        
            
            self.score.text = hscore
            
            if let string = hscore, let myInt = Int(string)
            {
                var parcentagescore = myInt*10
                
                self.performance.text = String(parcentagescore) + "%"
            }
        

        // Do any additional setup after loading the view.
    }
    

    

}
}
