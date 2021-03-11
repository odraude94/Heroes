//
//  Helpers+String.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 10/03/21.
//

import UIKit

extension String{
    ///Remove white spaces
    func trim()-> String{
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
