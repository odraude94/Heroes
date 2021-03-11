//
//  API.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 09/03/21.
//

import UIKit

struct API {
    
    struct ws {
        private static let domain = "https://superheroapi.com/api/10156112965520834"
        struct get {
            static let byID: String = domain + "/{:id}"
            static let search: String = domain + "/search/{:name}"
        }
    }

}
