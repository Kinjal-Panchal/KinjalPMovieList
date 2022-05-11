//
//  MovieListVC.swift
//  KinjalPractical
//
//  Created by Kinjal panchal on 11/05/22.
//

import UIKit

class MovieListVC: UIViewController {

    //MARK: ===== Outlets ========
    @IBOutlet weak var tblList: UITableView!
    
    //MARK: ====== Variables =====
    var movieviewmodel = MovieListViewModel()
    var arrMovies = [MovieList]()
    var pageNo = 1
    var isneedToReload = false
    var pagelimit = 20
    var refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.addTarget(self, action:
                   #selector(self.handleRefresh(_:)),
                                        for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.gray
               tblList.addSubview(refreshControl)
        setNavBar(Title: "MovieList", isTranslucent: false)
        movieviewmodel.movieListVC = self
        movieviewmodel.webserviceCallMovieList(isShowHud: true, Page:pageNo)
        self.navigationItem.title = "MovieList"
    }
    
    func latestReload(){
        pageNo = 1
        isneedToReload = false
        movieviewmodel.webserviceCallMovieList(isShowHud: true, Page:pageNo)

    }
    
    func ReloadMore(){
        pageNo += 1
        isneedToReload = false
        movieviewmodel.webserviceCallMovieList(isShowHud: true, Page:pageNo)

    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        movieviewmodel.webserviceCallMovieList(isShowHud: false, Page:1)
    }
}

//MARK: ===== TableView DataSource and delegate  ======
extension MovieListVC : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovies.count != 0 ? arrMovies.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if arrMovies.count != 0  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTblCell", for: indexPath) as! MovieTblCell
        cell.lblDate.text  = arrMovies[indexPath.row].releaseDate
        cell.lblTitle.text = arrMovies[indexPath.row].originalTitle
        cell.lblDescription.text = arrMovies[indexPath.row].overview
        Utility.imageGet(url: UrlConstant.imgPoster + arrMovies[indexPath.row].posterPath!, img: cell.imgPoster)
        
        if isneedToReload == true && indexPath.row == arrMovies.count - 4 {
            ReloadMore()
        }
        return cell
        
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      if arrMovies.count != 0 {
        let detailvc : DetailVC = DetailVC.instantiate(appStoryboard: .main)
        detailvc.strMovieId = arrMovies[indexPath.row].id ?? 0
        self.navigationController?.pushViewController(detailvc, animated: true)
       }
    }
}
