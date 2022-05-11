//
//  MovieTblCell.swift
//  KinjalPractical
//
//  Created by Kinjal panchal on 11/05/22.
//

import UIKit

class MovieTblCell: UITableViewCell {

    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
