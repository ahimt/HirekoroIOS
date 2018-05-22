//
//  CustomTableViewCell.swift
//  AdPostingApp
//
//  Created by IMTIAZ AHMED on 22/05/2018.
//  Copyright © 2018 IMTIAZ AHMED. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var proimage: UIImageView!    
    
    @IBOutlet weak var Title: UILabel!
   
    @IBOutlet weak var Price: UILabel!
    
    @IBOutlet weak var Description: UITextView!

    @IBOutlet weak var Address: UILabel!
    
    @IBOutlet weak var Email: UILabel!
    
    @IBOutlet weak var Duedate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
