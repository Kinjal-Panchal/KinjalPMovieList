//
//  MovieViewModel.swift
//  KinjalPractical
//
//  Created by Kinjal panchal on 11/05/22.
//

import Foundation
import UIKit
import SystemConfiguration

class MovieListViewModel{
    weak var movieListVC : MovieListVC? = nil
    func webserviceCallMovieList(isShowHud:Bool , Page:Int){
        if isShowHud {
            Utility.showHUD()
        }
        
        if !Reachability.isConnectedToNetwork() {
            Utility.ShowAlert(Title: "Network error", OfMessage: UrlConstant.NoInternetConnection)
            return
        }
        movieListVC?.refreshControl.endRefreshing()
       
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(ApiKey.strApiKey.rawValue)&page=\(Page)")!
          URLSession.shared.fetchData(for: url) { (result: Result<RootMovieList, Error>) in
              Utility.hideHUD()
            switch result {
            case .success(let model):
                print(result)
                if model.results?.count != 0 {
                    if self.movieListVC?.pagelimit == model.results?.count{
                        self.movieListVC?.isneedToReload = true
                    }
                    else{
                        self.movieListVC?.isneedToReload = false
                        
                    }
                    
                    if Page == 1 {
                        self.movieListVC?.arrMovies = model.results!
                    }
                    else {
                        self.movieListVC?.arrMovies.append(contentsOf:model.results!)
                    }
                    
                    
                    DispatchQueue.main.async {
                        self.movieListVC?.tblList.reloadData()

                    }
                }
                
              // A list of todos!
            case .failure(let error):
                Utility.ShowAlert(Title: "Error", OfMessage: error.localizedDescription)

          }
        }
    }
}

