//
//  PowerstatsVC.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 11/03/21.
//

import UIKit

class PowerstatsVC: UIViewController {
    
    let imvHero = UIImageView()
    var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = hero?.name
        
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        view.backgroundColor = .white
        
        let guide = view.safeAreaLayoutGuide
        
        let width = guide.layoutFrame.size.width * 0.5
        
        view.addSubview(imvHero)
        imvHero.translatesAutoresizingMaskIntoConstraints = false
        imvHero.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        imvHero.centerXAnchor.constraint(equalTo: guide.centerXAnchor, constant: 0).isActive = true
        imvHero.heightAnchor.constraint(equalToConstant: width).isActive = true
        imvHero.widthAnchor.constraint(equalToConstant: width).isActive = true
        imvHero.clipsToBounds = true
        imvHero.layer.cornerRadius = width/2
        if let url = URL(string:hero?.image?.url ?? ""){
            imvHero.kf.setImage(with: url)
        }
        imvHero.roundedBorder(radius: width/2, borderWidth: 5, borderColor: UIColor.random.cgColor)
        
        let vCombat = StatusHeroView()
        view.addSubview(vCombat)
        vCombat.lblFeature.text = "Combat: \(hero?.powerstats?.combat ?? "")"
        vCombat.points = hero?.powerstats?.combat ?? "0"
        vCombat.topAnchor.constraint(equalTo: imvHero.bottomAnchor, constant: 10).isActive = true
        vCombat.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16).isActive = true
        vCombat.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16).isActive = true
        vCombat.setUI()
        
        let vDurability = StatusHeroView()
        view.addSubview(vDurability)
        vDurability.lblFeature.text = "Durability: \(hero?.powerstats?.durability ?? "")"
        vDurability.points = hero?.powerstats?.durability ?? "0"
        vDurability.topAnchor.constraint(equalTo: vCombat.bottomAnchor, constant: 8).isActive = true
        vDurability.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16).isActive = true
        vDurability.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16).isActive = true
        vDurability.setUI()
        
        let vIntelligence = StatusHeroView()
        view.addSubview(vIntelligence)
        vIntelligence.lblFeature.text = "Intelligence: \(hero?.powerstats?.intelligence ?? "")"
        vIntelligence.points = hero?.powerstats?.intelligence ?? "0"
        vIntelligence.topAnchor.constraint(equalTo: vDurability.bottomAnchor, constant: 8).isActive = true
        vIntelligence.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16).isActive = true
        vIntelligence.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16).isActive = true
        vIntelligence.setUI()
        
        let vPower = StatusHeroView()
        view.addSubview(vPower)
        vPower.lblFeature.text = "Power: \(hero?.powerstats?.power ?? "")"
        vPower.points = hero?.powerstats?.power ?? "0"
        vPower.topAnchor.constraint(equalTo: vIntelligence.bottomAnchor, constant: 8).isActive = true
        vPower.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16).isActive = true
        vPower.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16).isActive = true
        vPower.setUI()
        
        let vSpeed = StatusHeroView()
        view.addSubview(vSpeed )
        vSpeed .lblFeature.text = "Speed: \(hero?.powerstats?.speed ?? "")"
        vSpeed .points = hero?.powerstats?.speed ?? "0"
        vSpeed .topAnchor.constraint(equalTo: vPower.bottomAnchor, constant: 8).isActive = true
        vSpeed .leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16).isActive = true
        vSpeed .trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16).isActive = true
        vSpeed .setUI()
        
        let vStrength = StatusHeroView()
        view.addSubview(vStrength )
        vStrength.lblFeature.text = "Strength: \(hero?.powerstats?.strength ?? "")"
        vStrength.points = hero?.powerstats?.strength ?? "0"
        vStrength.topAnchor.constraint(equalTo: vSpeed.bottomAnchor, constant: 8).isActive = true
        vStrength.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16).isActive = true
        vStrength.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16).isActive = true
        vStrength.setUI()
        
    }
    
}

class StatusHeroView: UIView{
    
    let lblFeature = UILabel()
    let vPoints = UIView()
    var points: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    func setUI(){
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(lblFeature)
        lblFeature.translatesAutoresizingMaskIntoConstraints = false
        lblFeature.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        lblFeature.centerXAnchor.constraint(equalTo:centerXAnchor, constant: 0).isActive = true
        
        addSubview(vPoints)
        vPoints.backgroundColor = UIColor.random
        vPoints.translatesAutoresizingMaskIntoConstraints = false
        vPoints.topAnchor.constraint(equalTo: lblFeature.bottomAnchor, constant: 0).isActive = true
        vPoints.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        vPoints.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        if let n = NumberFormatter().number(from: points) {
            let f = CGFloat(truncating: n)
            vPoints.widthAnchor.constraint(equalToConstant:f ).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
