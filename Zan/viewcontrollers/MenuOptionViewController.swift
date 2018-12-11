//
//  MenuOptionViewController.swift
//  Zan
//
//  Created by Alessandro dos Santos Pinto on 11/12/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import UIKit

class MenuOptionViewController: UIViewController {
    
    var menuOption: String?
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = menuOption
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
