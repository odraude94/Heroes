//
//  Biography.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 09/03/21.
//

import UIKit

class Biography: NSObject, Decodable {
    
    var aliases : [String]?
    var alignment : String?
    var alterEgos : String?
    var firstAppearance : String?
    var fullName : String?
    var placeOfBirth : String?
    var publisher : String?
    
    enum CodingKeys: String, CodingKey {
        case aliases = "aliases"
        case alignment = "alignment"
        case alterEgos = "alter-egos"
        case firstAppearance = "first-appearance"
        case fullName = "full-name"
        case placeOfBirth = "place-of-birth"
        case publisher = "publisher"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        aliases = try values.decodeIfPresent([String].self, forKey: .aliases)
        alignment = try values.decodeIfPresent(String.self, forKey: .alignment)
        alterEgos = try values.decodeIfPresent(String.self, forKey: .alterEgos)
        firstAppearance = try values.decodeIfPresent(String.self, forKey: .firstAppearance)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        placeOfBirth = try values.decodeIfPresent(String.self, forKey: .placeOfBirth)
        publisher = try values.decodeIfPresent(String.self, forKey: .publisher)
    }
}
