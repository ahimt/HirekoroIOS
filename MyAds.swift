//
//  MyAds.swift
//  AdPostingApp
//
//  Created by IMTIAZ AHMED on 22/05/2018.
//  Copyright © 2018 IMTIAZ AHMED. All rights reserved.
//

import UIKit

class MyAds: UIViewController , UITableViewDataSource , UITableViewDelegate  {
    
    
   var MainElements =  [String]()
 
    
    @IBOutlet weak var MainTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainTableView.delegate = self
        MainTableView.dataSource = self
        
        // This page shows all the date saved on our server for display the ads
        // First we select a TableView and use it as a default for this page, So we used MainTableView on this
        // Then we go to our server link and collect all the ad informations using the link
        
            if let url = URL(string: "https://ahimt.000webhostapp.com/AllAdPost.php") {
                do {
                    let contents = try String(contentsOf: url)   // we store all data in our content variable as a string
                    
                      print(contents)
                    
               let array = contents.components(separatedBy: ";")  // we separate this string by this simble for proper formating
                    
             
           
                    for i in array{
                        
                   MainElements.append(i)      // we push all the data in our Main Elements array
                        
                    
                    }
                    
                  
                    
                } catch {
                    // contents could not be loaded
                }
            }
        
     

        // Do any additional setup after loading the view.
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return MainElements.count-1
        
    }
    
 
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellProto") as! CustomTableViewCell
        // we get our custom made cells for the TableView which is named "CustomCellProto"
       
        let AdObject = MainElements[indexPath.row].components(separatedBy: ",")
        
                     print(AdObject.count)
        
       
        
            cell.Title.text = AdObject[0]   // We show the title
            cell.Description.text = AdObject[1]  // we show the Description
            cell.Price.text = AdObject[2]     // we show the price
            cell.Address.text = AdObject[3]    // we show the Address
            cell.Duedate.text = AdObject[4]    // we show the Duedate
            cell.Email.text = AdObject[5]      // we show the Email
            
                    return cell // return cell on the table view
  
   
    
    }
    

    
    

}
