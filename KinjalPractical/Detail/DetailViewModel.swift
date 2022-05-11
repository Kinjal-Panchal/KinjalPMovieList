//
//  DetailViewModel.swift
//  KinjalPractical
//
//  Created by Kinjal panchal on 12/05/22.
//

import Foundation

import SystemConfiguration

class DetailViewModel{
    
    weak var detailVC : DetailVC? = nil
    
    func webserviceCallMovieDetail(movieId:Int){
        Utility.showHUD()
        if !Reachability.isConnectedToNetwork() {
            Utility.ShowAlert(Title: "Network error", OfMessage: UrlConstant.NoInternetConnection)
            return
        }
        
        let url = URL(string:APIEnvironment.baseURL +  "movie/\(movieId)?api_key=\(ApiKey.strApiKey.rawValue)")!
          URLSession.shared.fetchData(for: url) { (result: Result<RootMovieDetail, Error>) in
              Utility.hideHUD()
            switch result {
            case .success(let model):
                print(result)
                self.detailVC?.objDetail = model
                DispatchQueue.main.async {
                    self.detailVC?.dataSetup()
                }
            case .failure(let error):
                Utility.ShowAlert(Title: "Error", OfMessage: error.localizedDescription)

          }
        }
    }
}

