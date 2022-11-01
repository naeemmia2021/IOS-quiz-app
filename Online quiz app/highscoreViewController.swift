//
//  highscoreViewController.swift
//  Online quiz app
//
//  Created by kuet on 4/11/21.
//  Copyright © 2021 kuet. All rights reserved.
//

import UIKit
import FirebaseDatabase


class highscoreViewController: UIViewController {

    @IBOutlet weak var highscore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let ref = Database.database().reference()
        ref.child("score").observeSingleEvent(of: .value) {(snapshot) in
        let val = snapshot.value as? NSDictionary
            
            let hscore = val?["highscore"] as? String
            
            
            self.highscore.text = hscore

        // Do any additional setup after loading the view.
    }
    
    

}
}
