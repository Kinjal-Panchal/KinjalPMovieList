//
//  Extension.swift
//  KinjalPractical
//
//  Created by Kinjal panchal on 12/05/22.
//

import Foundation
import UIKit


enum AppStoryboard: String {
    case main = "Main"
    
}


extension UIViewController {
    

func setNavBar(Title:String,isTranslucent : Bool)
{
   
    
    self.navigationItem.title = Title//.uppercased()
    self.navigationController?.isNavigationBarHidden = false
    //    self.navigationController?.navigationBar.isOpaque = false
    self.navigationController?.navigationBar.barTintColor =  UIColor(red: 22/255, green: 30/255, blue: 38/255, alpha: 1.0)
    self.navigationController?.navigationBar.tintColor = UIColor.white;
    self.navigationController?.navigationBar.isTranslucent = isTranslucent
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
   
   }
    
    @objc func LeftBtnAction(){
    
    }

    class func instantiate<T: UIViewController>(appStoryboard: AppStoryboard) -> T {

        let storyboard = UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }

}
