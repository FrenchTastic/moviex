//
//  MovieCell.swift
//  moviex
//
//  Created by Romain Pardon on 07/08/2016.
//  Copyright © 2016 SlasherApp. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var urlLbl: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        movieImg.clipsToBounds = true
        movieImg.layer.cornerRadius = 4.0
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(movie: Movie) {
        movieImg.image = movie.getMovieImage()
        movieLbl.text =  movie.title
        descLbl.text = movie.desc
        urlLbl.text = movie.imdbUrl
    }

}
