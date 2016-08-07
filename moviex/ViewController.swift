//
//  ViewController.swift
//  moviex
//
//  Created by Romain Pardon on 07/08/2016.
//  Copyright © 2016 SlasherApp. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let logo = UIImage(named: "MovieX.png")
        let imageView = UIImageView(image:logo)
        imageView.frame = CGRectMake(0, 0, 103.0, 20.0);
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        self.navigationItem.titleView = imageView
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        loadData()
        tableView.reloadData()
    }
    
    func loadData() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let request = NSFetchRequest(entityName: "Movie")
        do {
            let moviesData = try context.executeFetchRequest(request) as? [Movie]
            movies = moviesData!
        } catch {
            print("Can't retrieve objects")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            cell.configureCell(movies[indexPath.row])
            return cell
        } else {
            return MovieCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailMovie" {
            let detailVC = segue.destinationViewController as! DetailMovieVC
            detailVC.movie = movies[tableView.indexPathForSelectedRow!.row]
        }
    }

}

