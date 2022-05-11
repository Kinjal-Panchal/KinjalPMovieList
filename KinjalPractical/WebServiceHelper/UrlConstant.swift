//
//  UrlConstant.swift
//  KinjalPractical
//
//  Created by Kinjal panchal on 11/05/22.
//

import Foundation
import UIKit

let appDel = UIApplication.shared.delegate as! AppDelegate

enum APIEnvironment : String {

    case Development = "https://api.themoviedb.org/3/"

    static var baseURL: String{
        return APIEnvironment.environment.rawValue
    }

    static var environment: APIEnvironment{
        return .Development
    }

    static var headers : [String:String]
    {
         return ["":""]
    }
}

enum ApiKey: String {
case strApiKey = "14bc774791d9d20b3a138bb6e26e2579"
case MovieList  = "discover/movie?api_key=14bc774791d9d20b3a138bb6e26e2579&page=1"
case MovieDetail = "movie/675353&api_key=14bc774791d9d20b3a138bb6e26e2579"

}


class UrlConstant{
    static let imgPoster = "https://image.tmdb.org/t/p/w200"
    static let imgcover = "https://image.tmdb.org/t/p/w500"
    static let ResponseMessage = "message"

    //MARK:- Message Title
    static let Success = "Success"
    static let Failed = "Failed"
    static let Status = "status"
    static let SomethingWentWrong = "There is some server side error, Please try again after some time!"
    static let NoInternetConnection = "Unable to connect the server. Check your connection and try again later!"
}

