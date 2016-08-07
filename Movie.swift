//
//  Movie.swift
//  moviex
//
//  Created by Romain Pardon on 07/08/2016.
//  Copyright © 2016 SlasherApp. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: image!)!
        return img
    }
    
    func setMovieImage(image: UIImage) {
        let dataImage =  UIImagePNGRepresentation(image
        )
        self.image = dataImage
    }
    
    func saveMovie() {
        
    }
    
}
