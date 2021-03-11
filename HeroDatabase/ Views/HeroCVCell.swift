//
//  HeroCVCell.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 10/03/21.
//

import UIKit

class HeroCVCell: UICollectionViewCell {
    
    let imvHeroe = UIImageView()
    let lblName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        let width = frame.size.width-35
        
        contentView.addSubview(imvHeroe)
        imvHeroe.contentMode = .scaleAspectFill
        imvHeroe.translatesAutoresizingMaskIntoConstraints = false
        imvHeroe.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        imvHeroe.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        imvHeroe.heightAnchor.constraint(equalToConstant: width).isActive = true
        imvHeroe.widthAnchor.constraint(equalToConstant: width).isActive = true
        imvHeroe.clipsToBounds = true
        imvHeroe.layer.cornerRadius = width/2
        imvHeroe.roundedBorder(radius: width/2, borderWidth: 5, borderColor: UIColor.random.cgColor)
        
        contentView.addSubview(lblName)
        lblName.textAlignment = .center
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
        lblName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        lblName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
}
