//
//  DetailVC.swift
//  KinjalPractical
//
//  Created by Kinjal panchal on 11/05/22.
//

import UIKit

class DetailVC: UIViewController {

    
    //MARK: ==== Outlets ======
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblOverView: UILabel!
    @IBOutlet weak var lblGeneres: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblCompanies: UILabel!
    @IBOutlet weak var lblLanguages: UILabel!
    @IBOutlet weak var lblBudget: UILabel!
    @IBOutlet weak var lblRevenue: UILabel!
    
    
    //MARK: ===== Variables =====
    var objDetail : RootMovieDetail?
    var detailViewModel = DetailViewModel()
    var strMovieId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar(Title: "\(objDetail?.title ?? "")", isTranslucent: false)
        detailViewModel.detailVC = self
        detailViewModel.webserviceCallMovieDetail(movieId:strMovieId)
    }
    
    //MARK: == DataSetup ====
    func dataSetup(){
        Utility.imageGet(url: UrlConstant.imgPoster + (objDetail?.posterPath ?? ""), img: imgPoster)
        Utility.imageGet(url: UrlConstant.imgcover + (objDetail?.backdropPath ?? ""), img: imgCover)
        lblDescription.text = objDetail?.tagline
        lblTitle.text = objDetail?.title
        lblOverView.text = objDetail?.overview
        if let generes = objDetail?.genres?.map({$0.name!}) {
            let strgeneres = generes.joined(separator: ",")
            lblGeneres.text = strgeneres
        }
        
        
        if let languages = objDetail?.spokenLanguages?.map({$0.englishName!}){
            let strlanguages = languages.joined(separator: ",")
            lblLanguages.text = strlanguages

        }
        
        
        if let companies  = objDetail?.productionCompanies?.map({$0.name!}){
            let strCompanies = companies.joined(separator: ",")
            lblCompanies.text = strCompanies
            
        }
        
        
        lblBudget.text = "$ \(objDetail?.budget ?? 0)"
        lblRevenue.text = "$ \(objDetail?.revenue ?? 0)"
        lblReleaseDate.text = objDetail?.releaseDate
        lblDuration.text = "\(objDetail?.runtime ?? 0) Minutes"
    }
    


}
