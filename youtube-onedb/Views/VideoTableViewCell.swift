//
//  VideoTableViewCell.swift
//  youtube-onedb
//
//  Created by Omega on 8/9/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        //Ensure we have a video
        guard self.video != nil else {
            return
        }
        
        // Set the title and date label
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // Set the thumbnail data
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared URL session object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the CacheManager
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                
                // Check download url matches video thumbnail url
                if url!.absoluteString != self.video?.thumbnail {
                 
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                // Create image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.sync {
                    self.thumbnailImageView.image = image
                }
                
            }
            
        }
        // Start the data task
        dataTask.resume()
        
    }

}
