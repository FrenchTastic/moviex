//
//  DetailMovieVC.swift
//  moviex
//
//  Created by Romain Pardon on 07/08/2016.
//  Copyright © 2016 SlasherApp. All rights reserved.
//

import UIKit

class DetailMovieVC: UIViewController {
    
    var movie: Movie!

    @IBOutlet weak var movieImg: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movie.title)
        movieImg.image = movie.getMovieImage()
        movieTitle.text = movie.title
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
