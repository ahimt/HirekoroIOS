//
//  LoginPage.swift
//  AdPostingApp
//
//  Created by IMTIAZ AHMED on 14/05/2018.
//  Copyright © 2018 IMTIAZ AHMED. All rights reserved.
//

import UIKit

class LoginPage: UIViewController {
    

    
    @IBOutlet weak var AlertButton: UIButton!
    
    
    func ShowAllert(alertTitle : String,alertMessage: String){
        
        
        let alertController = UIAlertController(title: alertTitle, message:
            alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    @IBAction func MessagesButtonAction(_ sender: Any) {
        
         GoToMessages()
        
        
    }
    
    
    @IBAction func MyProfileButton(_ sender: Any) {
        
        GoToProfile()
    }
    
    
    
 

    
    
    
    
   
    
    
    
    
    
    
    
    func GoToMessages() {
        
       ShowAllert(alertTitle : "Messages",alertMessage: "Messages")
        
    }
    
    func GoToProfile() {
        
        ShowAllert(alertTitle : "GoToProfile",alertMessage: "GoToProfile")
        
    }
    
  
  
   
    
   
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
