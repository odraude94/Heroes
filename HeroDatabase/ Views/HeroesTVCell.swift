//
//  HeroesTVCell.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 10/03/21.
//

import UIKit

class HeroesTVCell: UITableViewCell {
    
    var cvHeroes: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
        cvHeroes = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cvHeroes.backgroundColor = .white
        cvHeroes.collectionViewLayout = layout
        cvHeroes.showsHorizontalScrollIndicator = false
        cvHeroes.register(HeroCVCell.self, forCellWithReuseIdentifier: "HeroCVCell")
        
        contentView.addSubview(cvHeroes)
        cvHeroes.translatesAutoresizingMaskIntoConstraints = false
        cvHeroes.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        cvHeroes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        cvHeroes.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        cvHeroes.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        cvHeroes.delegate = dataSourceDelegate
        cvHeroes.dataSource = dataSourceDelegate
        cvHeroes.tag = row
        cvHeroes.reloadData()
    }

}
