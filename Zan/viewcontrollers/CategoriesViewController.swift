//
//  CategoriesViewController.swift
//  Zan
//
//  Created by Alessandro Santos Pinto on 03/10/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
	
	var categories = [Categorie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let api = ConnectionController()
		api.loadCategories { [weak self] (categories) in
			self?.categories = categories;
		}
    }
}
