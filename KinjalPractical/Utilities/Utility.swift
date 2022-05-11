//
//  Utilities.swift
//  Practical Kinjal Panchal
//
//  Created by kinjal panchal on 25/07/21.
//

import Foundation
import UIKit
import Kingfisher

enum viewComponentsTags : Int{
    case ActivityIndicator = 1001
    case ToastView = 2002

}
class Utility {

    //MARK: ====  Activity indicator
    class func showHUD() {
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
      guard let window = UIApplication.shared.keyWindow else { return}
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        //        activityIndicator.backgroundColor = .clear
        activityIndicator.layer.cornerRadius = 6
        activityIndicator.center = window.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .whiteLarge
        activityIndicator.color = UIColor.lightGray
        activityIndicator.tag = viewComponentsTags.ActivityIndicator.rawValue
        window.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    class func hideHUD() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return}
            let activityIndicator = window.viewWithTag(viewComponentsTags.ActivityIndicator.rawValue) as? UIActivityIndicatorView
            activityIndicator?.stopAnimating()
            activityIndicator?.removeFromSuperview()
            UIApplication.shared.endIgnoringInteractionEvents()
        }

    }

    class func imageGet(url : String , img:UIImageView , _ IndClr : UIColor = UIColor.green){
         img.kf.indicatorType = .activity
         let activity =  img.kf.indicator?.view as! UIActivityIndicatorView
        activity.color = UIColor.green

         img.kf.indicator?.startAnimatingView()
         let url = URL(string:(url))
         img.kf.setImage(with: url, placeholder: nil, options: [], progressBlock: nil) { (response) in

             img.kf.indicator?.stopAnimatingView()
         }
     }
    
    class func ShowAlert(Title : String ,OfMessage : String) {
        let alert = UIAlertController(title: Title, message: OfMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
       // present(alert, animated: true, completion: nil)
        appDel.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    class func getMessageFromApiResponse(param: Any) -> String {
        
        if let res = param as? String {
            return res
            
        }else if let resDict = param as? NSDictionary {
            
            if let msg = resDict.object(forKey: "message") as? String {
                return msg
                
            }else if let msg = resDict.object(forKey: "msg") as? String {
                return msg
                
            }else if let msg = resDict.object(forKey: "message") as? [String] {
                return msg.first ?? ""
                
            }
            
        }else if let resAry = param as? NSArray {
            
            if let dictIndxZero = resAry.firstObject as? NSDictionary {
                if let msg = dictIndxZero.object(forKey: "message") as? String {
                    return msg
                    
                }else if let msg = dictIndxZero.object(forKey: "msg") as? String {
                    return msg
                    
                }else if let msg = dictIndxZero.object(forKey: "message") as? [String] {
                    return msg.first ?? ""
                }
                
            }else if let msg = resAry as? [String] {
                return msg.first ?? ""
                
            }
        }
        return ""
    }

}



