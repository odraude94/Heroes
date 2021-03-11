//
//  HeroTVCell.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 10/03/21.
//

import UIKit

class HeroTVCell: UITableViewCell {
    
    let imvHero = UIImageView()
    let lblName = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let height = frame.size.height * 0.8
        
        contentView.addSubview(imvHero)
        imvHero.translatesAutoresizingMaskIntoConstraints = false
        imvHero.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        imvHero.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        imvHero.heightAnchor.constraint(equalToConstant: height).isActive = true
        imvHero.widthAnchor.constraint(equalToConstant: height).isActive = true
        imvHero.clipsToBounds = true
        imvHero.layer.cornerRadius = height/2
        imvHero.roundedBorder(radius: height/2, borderWidth: 2, borderColor: UIColor.random.cgColor)
        
        contentView.addSubview(lblName)
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        lblName.leadingAnchor.constraint(equalTo: imvHero.trailingAnchor, constant: 8).isActive = true
        lblName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
