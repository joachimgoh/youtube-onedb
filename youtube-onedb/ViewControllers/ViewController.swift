//
//  ViewController.swift
//  youtube-onedb
//
//  Created by Omega on 29/7/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set itself as the datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itslef as the delegate of the model
        model.delegate = self
        
        //var i = 0
        model.getVideo()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get a reference to the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        // Set the video property of the detial view controller
        detailVC.video = selectedVideo
        
    }
    
    // MARK: - Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        // Set the returned videos to our video property
        self.videos = videos
        // Refresh the tableview
        tableView.reloadData()
    }
    
    // MARK: - TableView Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // configure the cell with the data
        // Get the title for the video in question
        //let title = self.videos[indexPath.row].title
        let video = self.videos[indexPath.row]
    
        //cell.textLabel?.text = title
        cell.setCell(video)
        
        // return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

