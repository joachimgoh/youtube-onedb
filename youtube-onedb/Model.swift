//
//  Model.swift
//  youtube-onedb
//
//  Created by Omega on 10/8/21.
//

import Foundation

class Model {
    
    func getVideo() {
     
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            // Parse the data into video objects
        }
    
        // Kick off the task
        dataTask.resume()
        
    }
}
