//
//  AdPostInformations.swift
//  AdPostingApp
//
//  Created by IMTIAZ AHMED on 22/05/2018.
//  Copyright © 2018 IMTIAZ AHMED. All rights reserved.
//

import UIKit

class AdPostInformations: UIViewController {
    
    
    @IBOutlet weak var ReultLabel: UILabel!
    
    @IBOutlet weak var TitleField: UITextField!
    
 
    @IBOutlet weak var DescriptionField: UITextView!
    
    
    @IBOutlet weak var LocationField: UITextField!
    
    
    @IBOutlet weak var BudgetField: UITextField!
    
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    @IBAction func SubmitAction(_ sender: Any) {
        
        
        if(TitleField.text != ""){               // This is a verification process before saving data to the server
                                                 // It checks for invalid data inputs on the text fields such as
            if(DescriptionField.text != ""){     // title , description , location , budget
                                                 // if the verfication process succeeds then it goes through all of the
                if(LocationField.text != ""){    // if statements and calls the SaveAdPostsToDateBase()
                                                 // which will allow the user to save the data on the server
                    if(BudgetField.text != ""){
                        
                       SaveAdPostsToDateBase()
                        return
                        
                    }
                    
                }
                
            }
            
        }
        
        
        ReultLabel.text = "Empty field found!"    // If the verfication process fails the ResultLabel will show a invalid text on the display
        
        
    }
    
    
    
    
    func GoToMenu() {          // This function is to change the user screen
                               // At first it gets the class with Identifier MyAds then changes the current screen to the MyAds Screen
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyAds") as! MyAds
        present(vc, animated: true, completion: nil)
        
        
    }
    
    
    func SaveAdPostsToDateBase() {
        
                // This function is to save the data on our SQL server
        
    
        let dateFormatter = DateFormatter()       //This formates the date to a string which was picked by user while posting the ad
        dateFormatter.dateFormat = "yyyy-MM-dd"   // So that the data can be saved on the server as human readable way
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://ahimt.000webhostapp.com/CreateAdPost.php")! as URL)
        request.httpMethod = "POST"      //    Then we prepare our post request to our SQL server link using the NSMutableURLRequest
        
        let postString = "TITLE=\(TitleField.text!)&DESCRIPTION=\(DescriptionField.text!)&LOCATION=\(LocationField.text!)&BUDGET=\(BudgetField.text!)&EMAIL=\("AAA")&DUEDATE=\(dateFormatter.string(from: DatePicker.date))"
        
                                 // We prepare our variables (The Ad informations provided by the user) so that it can be passed
                                 // along the post request in the link
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
                                                                 // we run the post request an pass all the variables to our php script
            if error != nil {                                       // which takes the variables and runs SQL codes through our database
                                                                       // Then wee check for any error along the way
                self.ReultLabel.text = "Something went wrong"
                self.ReultLabel.textColor = UIColor.red                  // And Dislay an error message
                
                return
            }else{
                
                self.ReultLabel.text = "Ad Created!"                // If the result gets pass with no errors
                self.ReultLabel.textColor = UIColor.green           // it shows a success message waites for 1 second and calls the GoToMenu
                                                                    // function
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    
               
                    self.GoToMenu()
                    
                }
                
            }
           
        }
        task.resume()
        
        
        
    }
    
    
    

    override func viewDidLoad() {
        DescriptionField!.layer.borderWidth = 1
        DatePicker.minimumDate = Date()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
