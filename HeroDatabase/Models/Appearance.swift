//
//  Appearance.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 09/03/21.
//

import UIKit

class Appearance: NSObject, Decodable {
    
    var eyeColor : String?
    var gender : String?
    var hairColor : String?
    var height : [String]?
    var race : String?
    var weight : [String]?
    
    enum CodingKeys: String, CodingKey {
        case eyeColor = "eye-color"
        case gender = "gender"
        case hairColor = "hair-color"
        case height = "height"
        case race = "race"
        case weight = "weight"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        eyeColor = try values.decodeIfPresent(String.self, forKey: .eyeColor)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        hairColor = try values.decodeIfPresent(String.self, forKey: .hairColor)
        height = try values.decodeIfPresent([String].self, forKey: .height)
        race = try values.decodeIfPresent(String.self, forKey: .race)
        weight = try values.decodeIfPresent([String].self, forKey: .weight)
    }
}
