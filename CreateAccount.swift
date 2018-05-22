//
//  CreateAccount.swift
//  AdPostingApp
//
//  Created by IMTIAZ AHMED on 14/05/2018.
//  Copyright © 2018 IMTIAZ AHMED. All rights reserved.
//

import UIKit

class CreateAccount: UIViewController {
    
  
    
    @IBOutlet weak var USER_Name: UITextField!
    
    @IBOutlet weak var USER_Password: UITextField!
    
    @IBOutlet weak var USER_PassConfirm: UITextField!
    
    @IBOutlet weak var USER_Email: UITextField!
    
    @IBOutlet weak var ResultLabel_CreateACC: UILabel!
    
    @IBAction func CreateAccountBackButton(_ sender: Any) {
        
         self.GoToLoginPage()
        
    }
    
    
    @IBAction func CreateUserButtonAction(_ sender: Any) {
        
        if(USER_Name.text != ""){   // Checks if the provided user name was null
            
            if(USER_Password.text == USER_PassConfirm.text){  // Compares both passwords provided by the user
                
                if(USER_Email.text != ""){    // Checks if the provided email was null
                    
                    ResultLabel_CreateACC.isHidden = false             // if everything goes well we show success message on the display
                    ResultLabel_CreateACC.text = "Account Creating..."
                    ResultLabel_CreateACC.textColor = UIColor.green
                    
                 
                 
                    let request = NSMutableURLRequest(url: NSURL(string: "https://ahimt.000webhostapp.com/CreateUser.php")! as URL)
                    request.httpMethod = "POST"   // We prepare our variables (The Ad informations provided by the user) so that it can be passed
                    // along the post request in the link
                    
                    let postString = "USER_email=\(USER_Email.text!)&USER_name=\(USER_Name.text!)&USER_password=\(USER_Password.text!)"
             
                    
                    request.httpBody = postString.data(using: String.Encoding.utf8)
                    
                    let task = URLSession.shared.dataTask(with: request as URLRequest) {
                        data, response, error in
                        
                        
                        // we run the post request an pass all the variables to our php script
                        // which takes the variables and runs SQL codes through our database
                        // Then wee check for any error along the way
                        
                        
                        if error != nil {
                            self.FailedThis()
                            return
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            self.GoToLoginPage()
                        }
                    }
                    task.resume()
                    
                 
              
               
                    
                    return
                    
                
                }
            
            }
        
        }
            FailedThis()
        
        
        
    }
    
   public func GoToLoginPage() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyLoginBoard") as! ViewController
        present(vc, animated: true, completion: nil)
        
    }

    func FailedThis() {
        
        ResultLabel_CreateACC.isHidden = false
        ResultLabel_CreateACC.text = "FAILED!"
        ResultLabel_CreateACC.textColor = UIColor.red
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
         ResultLabel_CreateACC.isHidden = true  // Setting Display Result off at the start of this page load
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
