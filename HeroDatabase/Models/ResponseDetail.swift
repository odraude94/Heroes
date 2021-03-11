//
//  ResponseDetail.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 09/03/21.
//

import UIKit

class ResponseDetail: NSObject, Decodable
{
    // MARK: - Properties
    var type: String?
    var errors: Bool?
    var code: Int?
    var codeMessage: String?
    var message: String?
    var data: Data?
    var error: String?
}
