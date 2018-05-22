//
//  ViewController.swift
//  AdPostingApp
//
//  Created by IMTIAZ AHMED on 13/05/2018.
//  Copyright © 2018 IMTIAZ AHMED. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
  
    
    @IBOutlet weak var LoginEmail: UITextField!
    
    
    @IBOutlet weak var LoginPass: UITextField!
    
    @IBOutlet weak var LoginFailed: UILabel!
    
    
    
    
    @IBAction func PerformLogin(_ sender: Any) {
        
        
        if(LoginEmail.text != ""){      // Checks for any null email string if submitted by the user
        
            if(LoginPass.text != ""){    // checks for any null password string if submited by the user
                
                
        
                if let url = URL(string: "https://ahimt.000webhostapp.com/LoginUser.php") {
                    do {
                        // We go to our server link where all user data are stored
                        
                        let contents = try String(contentsOf: url)  // we store all the data on contents
                        
                         print("Started")
                        
                        if contents.range(of:LoginEmail.text!) != nil {   // we check if the contents has any string same as the users Email
                            
                               if contents.range(of:LoginPass.text!) != nil {  // Then it also checks for the password
                            
                            DispatchQueue.main.async {   // If everything was found we empty the previous data
                                self.LoginEmail.text = ""
                                self.LoginPass.text = ""   // And show proper success login and confirm the login
                                
                                self.LoginFailed.isHidden = false
                                self.LoginFailed.text = "Logged in!"
                                self.LoginFailed.textColor = UIColor.green
                                
                                           // If the login is confirmed after one second displaying the proper message we call
                                           // GoToMenu function to provide the user access to the Menu page
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    self.GoToMenu()     // We call the GoToMenu Function
                                }
                                
                                
                            }
                            
                                print("PassExists")
                            
                            }
                            
                            
                            print("NameExists")
                        }
                   
                        
                                 print("Ended")
                   
                        
                    } catch {
                        // contents could not be loaded
                    }
                }
                                
                                
                
                     
                      
           
                
               
                
                
                
            }
        
        
        }
        
        
        
        
    }
    
    
    func GoToMenu() {
        
        // This function is to change the user screen
        // At first it gets the class with Identifier MyAds then changes the current screen to the MyAds Screen
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "MenuPageBoard") as! LoginPage
        present(vc, animated: true, completion: nil)
        
      
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async(execute: {
            UIApplication.shared.registerForRemoteNotifications()
        }) 
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

