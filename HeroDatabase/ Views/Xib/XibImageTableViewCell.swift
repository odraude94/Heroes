//
//  XibImageTableViewCell.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 01/06/21.
//

import UIKit

class XibImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet  weak var labelTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
