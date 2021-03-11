//
//  AlertController.swift
//  HeroDatabase
//
//  Created by Eduardo Martinez on 09/03/21.
//

import UIKit

public typealias completionAlert = (() -> Void)?;

class AlertController: NSObject
{
    // MARK: - Properties
    var currentVC: UIViewController?
    var currentAlert: UIAlertController?
    
    // MARK: - Methods Created
    func dismissLoading(on vc: UIViewController, completion: completionAlert)
    {
        guard vc.presentedViewController is UIAlertController else { return }
        
        self.currentAlert = vc.presentedViewController as? UIAlertController
        
        DispatchQueue.main.async
        {
            self.currentAlert?.dismiss(animated: true, completion: completion)
        }
    }
    
    class func getCustomAlert(title: String?, message: String?) -> UIAlertController
    {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let mutableAttr: NSMutableAttributedString = NSMutableAttributedString(string: title ?? "")
        
        mutableAttr.addAttribute(.font, value: UIFont.systemFont(ofSize: 20.0), range: NSRange(location: 0, length: title?.count ?? 0))

        alert.setValue(mutableAttr, forKey: "attributedTitle")

        alert.view.tintColor = UIColor.darkGray
        
        return alert
    }
    
    func permission(on vc: UIViewController, title: String, message: String, sender: UIView, completion: @escaping ( _ status: Bool)  -> ())
    {
        self.currentAlert = AlertController.getCustomAlert(title: title, message: message)
       
        self.currentAlert?.addAction(UIAlertAction(title: "Aceptar", style: .default)
        {
            (UIAlertAction) in
            
            completion(true)
        })
        
        self.currentAlert?.addAction(UIAlertAction(title: "Cancelar", style: .cancel)
        {
            (UIAlertAction) in
            
            completion(false)
        })
        
        guard vc.presentingViewController != self.currentAlert else { return }
        
        if let popoverController = self.currentAlert?.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.permittedArrowDirections = UIPopoverArrowDirection()
            popoverController.sourceRect = CGRect(x: sender.bounds.midX, y: sender.bounds.midY, width: 0, height: 0)
            
        }
        
        vc.present(self.currentAlert!, animated: true)
    }
    
    class func show(on vc: UIViewController, title: String, msg: String)
    {
        let alert: UIAlertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        DispatchQueue.main.async
        {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    func show(on vc: UIViewController, title: String, msg: String, completion: completionAlert)
    {
        self.currentAlert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        
        self.currentAlert?.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        DispatchQueue.main.async
        {
            vc.present(self.currentAlert!, animated: true, completion: completion)
        }
    }
    
    func loading(on vc: UIViewController)
    {
        self.currentAlert = UIAlertController(title: nil, message: "espere...", preferredStyle: .alert)
        
        self.currentAlert?.popoverPresentationController?.sourceView = vc.view
        self.currentAlert?.popoverPresentationController?.sourceRect = vc.view.frame

        self.currentAlert?.view.tintColor = UIColor.black
        
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();

        self.currentAlert?.view.addSubview(loadingIndicator)
        
        guard self.currentAlert != nil else { return }
        
        DispatchQueue.main.async
            {
                vc.present(self.currentAlert!, animated: true, completion: nil)
        }
    }
}
