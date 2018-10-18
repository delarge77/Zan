//
//  CategoriesViewController.swift
//  Zan
//
//  Created by Alessandro Santos Pinto on 03/10/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	var categories = [Categorie]()
	@IBOutlet weak var categoriesCollectionView: UICollectionView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = ConnectionController()
		api.loadCategories { [weak self] (categories) in
			self?.categories = categories;
			self?.categoriesCollectionView.reloadData()
		}
    }
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return categories.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CategoryCell
		let category = categories[indexPath.row]
		cell.setTemporaryNameForCategory(category)
		return cell
	}
}
