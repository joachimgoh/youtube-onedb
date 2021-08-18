//
//  ViewController.swift
//  youtube-onedb
//
//  Created by Omega on 29/7/21.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //var i = 0
        model.getVideo()
        
    }


}

