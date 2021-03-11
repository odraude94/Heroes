//
//  Server.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 09/03/21.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

typealias completion = ((_ data: Foundation.Data?, _ error: NSError?) -> ())?;

class Server {
    
    // MARK: - Properties
    var parameters: [String: Any]? = [:]
    var alertController: AlertController? = AlertController()
    var decoder: JSONDecoder = JSONDecoder()
    var currentVC: UIViewController?
    
    // MARK: - Class’s Methods
    init()
    {
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    // MARK: - Methods Created
    private func defaultLoadingAlert(on vc: UIViewController)
    {
        self.currentVC = vc
        
        self.alertController?.loading(on: vc)
    }
    
    func allAlertsEnabled(on vc: UIViewController)
    {
        self.currentVC = vc
        
        self.defaultLoadingAlert(on: vc)
    }
    
    func dissmissLoading(completion: completionAlert)
    {
        guard self.currentVC != nil else { return }
        
        self.alertController?.dismissLoading(on: self.currentVC!, completion: completion)
    }
    
    func showAlert(title: String, message: String, completion: completionAlert)
    {
        guard self.currentVC != nil else { return }
        
        self.alertController?.show(on: self.currentVC!, title: title, msg: message, completion: completion)
    }
    
    func request(url: String, method: Alamofire.HTTPMethod, parameters: Parameters?, completion: completion)
    {
        print("URL => ", url)
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default).responseJSON
        {
            (response) in
            
            guard self.currentVC != nil else
            {
                self.handleResult(data: response.data, error: response.error, method: method, completion: completion)
                
                return
            }
            
            self.dissmissLoading
            {
                self.handleResult(data: response.data, error: response.error, method: method, completion: completion)
            }
            
        }.resume()
    }
    
    func request(url: String, completion: completion)
    {
        print("URL => ", url)
        
        Alamofire.request(url).responseData()
        {
            (response) in
            
            let json:JSON = JSON(response.data)
            print(json)
            
            guard self.currentVC != nil else
            {
                self.handleResult(data: response.data, error: response.error, method: nil, completion: completion)
                
                return
            }
            
            self.dissmissLoading
            {
                self.handleResult(data: response.data, error: response.error, method: nil, completion: completion)
            }
        }
    }
    

    func handleResult(data: Foundation.Data?, error: Error?, method: Alamofire.HTTPMethod?, completion: completion)
    {
        guard error == nil else
        {
            let nsError: NSError = error! as NSError
            
            self.showAlert(title: "Error", message: nsError.localizedDescription)
            {
                completion!(nil, nsError)
            }
            return
        }
        
        if let data: Foundation.Data = data,
            let responseDetail: ResponseDetail? = self.decodeObject(data: data),
            let error: String = responseDetail?.error
        {
            self.showAlert(title: "Error", message: error)
            {
                completion!(nil, nil)
            }
            return
        }
        
//        print(data?.toJSON())
        
        if method != nil
        {
            self.showAlert(title: "OK", message: "Acción realizada con éxito!")
            {
                completion!(data, nil)
            }
            
            return
        }
        
        completion!(data, nil)
    }
    
    func decodeObject<ObjectCls: Decodable>(data: Foundation.Data) -> ObjectCls?
    {
        do
        {
            return try self.decoder.decode(ObjectCls.self, from: data)
        }
        catch let error
        {
            print(error, "-Decode Array error-")
        
            return nil
        }
    }
}

