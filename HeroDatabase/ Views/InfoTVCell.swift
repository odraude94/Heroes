//
//  InfoTVCell.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 10/03/21.
//

import UIKit
import FontAwesome_swift

class InfoTVCell: UITableViewCell {
    
    let lblTitle = UILabel()
    let imvChevron = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        lblTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        contentView.addSubview(imvChevron)
        imvChevron.translatesAutoresizingMaskIntoConstraints = false
        imvChevron.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        imvChevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        imvChevron.image = UIImage.fontAwesomeIcon(name: .chevronRight, style: .solid, textColor: .black, size: CGSize(width: 25, height: 25))
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
