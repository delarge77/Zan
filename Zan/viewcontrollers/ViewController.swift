//
//  ViewController.swift
//  Zan
//
//  Created by Alessandro dos Santos Pinto on 10/09/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let api = ZanServiceAPI()
        api.loadVideos { (categories) in
            print("\(categories)")
        }
		
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

