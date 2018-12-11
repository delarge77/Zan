//
//  SendAndReceiveVideoViewController.swift
//  Zan
//
//  Created by Alessandro dos Santos Pinto on 14/11/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import UIKit

class SendAndReceiveVideoViewController: UIViewController {

    var categorie: String?
    @IBOutlet weak var categoryImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let categorie = categorie else { return }
        
        categoryImageView.image = UIImage(named: "\(categorie).png")
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
