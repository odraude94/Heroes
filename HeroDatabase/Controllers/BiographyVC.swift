//
//  BiographyVC.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 11/03/21.
//

import UIKit

class BiographyVC: UIViewController {
    
    var hero: Hero?
    let lblAlignment = UILabel()
    let lblAlterEgos = UILabel()
    let lblFirstAppearance = UILabel()
    let lblFullName = UILabel()
    let lblPlaceOfBirth = UILabel()
    let lblPublisher = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = hero?.name
        setupUI()
    }
     
    func setupUI(){
        
        view.backgroundColor = .white
        
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(lblFirstAppearance)
        lblFirstAppearance.translatesAutoresizingMaskIntoConstraints = false
        lblFirstAppearance.topAnchor.constraint(equalTo: guide.topAnchor , constant: 10).isActive = true
        lblFirstAppearance.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 8).isActive = true
        lblFirstAppearance.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -8).isActive = true
        lblFirstAppearance.numberOfLines = 0
        lblFirstAppearance.textAlignment = .center
        
        if let biography = hero?.biography{
        
        lblAlignment.text = "Alignment: \(biography.alignment ?? "")"
        lblAlterEgos.text = "Alter Egos: \(biography.alterEgos ?? "")"
        lblFirstAppearance.text = "First Appearance: \(biography.firstAppearance ?? "")"
        lblFullName.text = "Full Name: \(biography.fullName ?? "")"
        lblPublisher.text = "Publisher: \(biography.publisher ?? "")"
        lblPlaceOfBirth.text = "PlaceOfBirth: \(biography.placeOfBirth ?? "")"
    
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 16.0

        stackView.addArrangedSubview(lblAlignment)
        stackView.addArrangedSubview(lblAlterEgos)
        stackView.addArrangedSubview(lblFullName)
        stackView.addArrangedSubview(lblPlaceOfBirth)
        stackView.addArrangedSubview(lblPublisher)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        if let aliases = biography.aliases{
            
            for alias in aliases{
                let lbl = UILabel()
                lbl.text = "Aliases: \(alias)"
                stackView.addArrangedSubview(lbl)
            }
        }
        
        

        self.view.addSubview(stackView)
            stackView.topAnchor.constraint(equalTo: lblFirstAppearance.bottomAnchor, constant: 0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
       
        }
    }
    

}
