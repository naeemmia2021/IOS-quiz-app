//
//  testViewController.swift
//  Online quiz app
//
//  Created by kuet on 2/11/21.
//  Copyright © 2021 kuet. All rights reserved.
//

import UIKit
import FirebaseDatabase

var score = 0
var nque = Int.random(in: 1..<5)
var endque=nque+10
var preans = ""

class testViewController: UIViewController {

    @IBOutlet weak var Question: UILabel!
  
    @IBOutlet weak var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.op1.tag=1
        //self.op2.tag=2
        

        let ref = Database.database().reference()
        
        ref.child(String(nque)).observeSingleEvent(of: .value) {(snapshot) in
            let value = snapshot.value as? NSDictionary
            
            let question = value?["question"] as? String
            self.Question.text = question
            let answer = value?["answer"] as? String
            preans = answer!
        }
        print(nque)
        nque+=1
       
        
        
    
    }
    @IBAction func onBack(_ sender: Any) {
        nque=Int.random(in: 1..<5)
        endque=nque+10
        score=0
    }
    @IBAction func op1(_ sender: Any) {
        
        let ref = Database.database().reference()
        if(preans == "A")
        {
            score+=1
            self.result.text = "SCORE:" + String(score)
        }
        if(nque==endque)
        {
            nque=1
           // self.result.text = "Done"
            
            ref.child("score/lastscore").setValue(String(score))
            
            
            ref.child("score").observeSingleEvent(of: .value) {(snapshot) in
            let val = snapshot.value as? NSDictionary
                
                let hscore = val?["highscore"] as? String
                if let string = hscore, let myInt = Int(string) {
                    if myInt<score
                    {
                        ref.child("score/highscore").setValue(String(score))
                    }
                    
                }
                
               
            
        }
            score = 0
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Scores")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
            
    }
       
        
        
        
        ref.child(String(nque)).observeSingleEvent(of: .value) {(snapshot) in
            let value = snapshot.value as? NSDictionary
            
            let question = value?["question"] as? String
            self.Question.text = question
            
            let answer = value?["answer"] as? String
            preans = answer!
            
            nque+=1
            print(score)
            
            
    }
        
    }
       
    @IBAction func op2(_ sender: Any) {
        let ref = Database.database().reference()
        if(preans == "B")
        {
            score+=1
            self.result.text = "SCORE:" + String(score)
        }
        if(nque==endque)
        {
            nque=1
           // self.result.text = "Done"
            
            ref.child("score/lastscore").setValue(String(score))
            
            ref.child("score").observeSingleEvent(of: .value) {(snapshot) in
            let val = snapshot.value as? NSDictionary
                
                let hscore = val?["highscore"] as? String
                if let string = hscore, let myInt = Int(string) {
                    if myInt<score
                    {
                        ref.child("score/highscore").setValue(String(score))
                    }
                    
                }
            
        }
            score = 0
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Scores")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
            
        }
        
        ref.child(String(nque)).observeSingleEvent(of: .value) {(snapshot) in
            let value = snapshot.value as? NSDictionary
            
            let question = value?["question"] as? String
            self.Question.text = question
            
            let answer = value?["answer"] as? String
            
            
            preans = answer!

            nque+=1
            
           
    }
        
           
    }
  
   
        
    
   

}
