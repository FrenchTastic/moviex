//
//  CreateMovieVC.swift
//  moviex
//
//  Created by Romain Pardon on 07/08/2016.
//  Copyright © 2016 SlasherApp. All rights reserved.
//

import UIKit
import CoreData

class CreateMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var movieUrl: UITextField!
    @IBOutlet weak var movieSynopsis: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImg.layer.cornerRadius = 4.0
        movieImg.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    @IBAction func createMovie(sender: AnyObject) {
        if let title = movieTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            movie.title = movieTitle.text
            movie.desc = movieDesc.text
            movie.imdbUrl = movieUrl.text
            movie.imdbSynopsis = movieSynopsis.text
            movie.setMovieImage(movieImg.image!)
            context.insertObject(movie)
            do {
                try context.save()
            } catch {
                print("An error occured")
            }
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func addImage(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
    
}
