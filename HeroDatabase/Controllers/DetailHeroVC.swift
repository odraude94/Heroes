//
//  DetailHeroVC.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 10/03/21.
//

import UIKit
import Kingfisher

class DetailHeroVC: UIViewController {
    
    var tvInfo = UITableView()
    let imvHero = UIImageView()
    let lblName = UILabel()
    var hero: Hero?
    let details = ["Powerstats","Biography"]

    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
    }
    
    func setupUI(){
        
        view.backgroundColor = .white
        
        let guide = view.safeAreaLayoutGuide
        
        let width = guide.layoutFrame.size.width * 0.6
        
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
        
        view.addSubview(lblName)
        lblName.text = hero?.name
        lblName.textAlignment = .center
        lblName.font = UIFont.systemFont(ofSize: 26)
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.topAnchor.constraint(equalTo: imvHero.bottomAnchor, constant: 10).isActive = true
        lblName.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16).isActive = true
        lblName.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16).isActive = true
        
        let lblGender = UILabel()
        lblGender.text = "Gender: \(hero?.appearance?.gender ?? "")"
        view.addSubview(lblGender)
        lblGender.translatesAutoresizingMaskIntoConstraints = false
        lblGender.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 0).isActive = true
        lblGender.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 8).isActive = true
        
        let lblRace = UILabel()
        lblRace.text = "Race: \(hero?.appearance?.race ?? "")"
        view.addSubview(lblRace)
        lblRace.translatesAutoresizingMaskIntoConstraints = false
        lblRace.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 0).isActive = true
        lblRace.leadingAnchor.constraint(equalTo: lblGender.trailingAnchor, constant: 8).isActive = true
        
        let lblHeight = UILabel()
        lblHeight.text = "Height: \(hero?.appearance?.height?[1] ?? "")"
        view.addSubview(lblHeight)
        lblHeight.translatesAutoresizingMaskIntoConstraints = false
        lblHeight.topAnchor.constraint(equalTo: lblGender.bottomAnchor, constant: 0).isActive = true
        lblHeight.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 8).isActive = true
        
        let lblWeight = UILabel()
        lblWeight.text = "Weight: \(hero?.appearance?.weight?[1] ?? "")"
        view.addSubview(lblWeight)
        lblWeight.translatesAutoresizingMaskIntoConstraints = false
        lblWeight.topAnchor.constraint(equalTo: lblGender.bottomAnchor, constant: 0).isActive = true
        lblWeight.leadingAnchor.constraint(equalTo: lblGender.trailingAnchor, constant: 15).isActive = true
        
        let lblOcupation = UILabel()
        lblOcupation.numberOfLines = 2
        lblOcupation.text = "Ocupation: \(hero?.work?.occupation ?? "")"
        view.addSubview(lblOcupation)
        lblOcupation.translatesAutoresizingMaskIntoConstraints = false
        lblOcupation.topAnchor.constraint(equalTo: lblWeight.bottomAnchor, constant: 0).isActive = true
        lblOcupation.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 8).isActive = true
        lblOcupation.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -8).isActive = true
        
        let lblBase = UILabel()
        lblBase.numberOfLines = 2
        lblBase.text = "Base: \(hero?.work?.base ?? "")"
        view.addSubview(lblBase)
        lblBase.translatesAutoresizingMaskIntoConstraints = false
        lblBase.topAnchor.constraint(equalTo: lblOcupation.bottomAnchor, constant: 0).isActive = true
        lblBase.leadingAnchor.constraint(
            equalTo: guide.leadingAnchor, constant: 8).isActive = true
        lblBase.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -8).isActive = true
        
        tvInfo.backgroundColor = .white
        tvInfo.register(InfoTVCell.self, forCellReuseIdentifier: "InfoTVCell")
        tvInfo.dataSource = self
        tvInfo.delegate = self
        
        view.addSubview(tvInfo)
        tvInfo.translatesAutoresizingMaskIntoConstraints = false
        tvInfo.topAnchor.constraint(equalTo:lblBase.bottomAnchor, constant: 8).isActive = true
        tvInfo.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0).isActive = true
        tvInfo.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0).isActive = true
        tvInfo.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0).isActive = true
        
    }


}

extension DetailHeroVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTVCell", for: indexPath) as! InfoTVCell
        
        cell.lblTitle.text = details[indexPath.row]
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = PowerstatsVC()
            vc.hero = self.hero
            navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
            let vc = BiographyVC()
            vc.hero = self.hero
            navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }
    
}
