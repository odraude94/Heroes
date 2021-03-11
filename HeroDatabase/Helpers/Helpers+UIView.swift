//
//  Helpers+UIView.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 10/03/21.
//

import UIKit

extension UIView{
    ///Rounded any UIView component
    func isRounded(){
        self.layoutIfNeeded()
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width/2
    }
    
    func roundedBorder() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0
        // self.layer.borderColor = UIColor.black.cgColor
    }
    
    func roundedBorder(radius:CGFloat) {
        
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 0
        // self.layer.borderColor = UIColor.black.cgColor
    }
    
    func roundedBorder(radius:CGFloat, borderWidth: CGFloat, borderColor:CGColor) {
        
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
    
    ///Apply shadow in any UIView component
    func makeShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
    }
    
    func makeShadow(color:CGColor, opacity: Float, radious:CGFloat) {
        self.layer.shadowColor = color
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0 , height:2)
        self.layer.shadowRadius = radious
    }
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    
}
