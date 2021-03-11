//
//  Hero.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 09/03/21.
//

import UIKit

class Hero: NSObject, Decodable {
    
    var name : String?
    var appearance : Appearance?
    var biography : Biography?
    var connections : Connection?
    var id : String?
    var image : Image?
    var powerstats : Powerstat?
    var response : String?
    var work : Work?
}

