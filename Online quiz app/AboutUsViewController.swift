//
//  AboutUsViewController.swift
//  Online quiz app
//
//  Created by kuet on 28/10/21.
//  Copyright © 2021 kuet. All rights reserved.
//

import UIKit

struct Student: Decodable {
   
    let name1:String
     let name2:String
    let name3:String
    let name4:String
    let name5:String
    let name6:String
}
class AboutUsViewController: UIViewController {

    @IBOutlet weak var aboutus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://mocki.io/v1/6da2538b-1c3e-4125-a9e1-2e8606e6e0a5"
        
        guard let url=URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data,response,err) in
            guard let pdata=data else {return}
            do{
                let student = try JSONDecoder().decode(Student.self, from: pdata)

                DispatchQueue.main.async {
                    
                    self.aboutus.text = student.name1 + "\n\n" + student.name2 + "\n\n" + student.name3 + "\n\n" + student.name4 + "\n\n"+student.name5 + "\n\n"+student.name6
                }
                
            }catch let jsonErr {
                print("error in passing",jsonErr)
            }
        }.resume()
        

        // Do any additional setup after loading the view.
    }
    


}
