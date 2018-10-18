//
//  CategoryCell.swift
//  Zan
//
//  Created by Alessandro Santos Pinto on 18/10/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
	
	@IBOutlet weak var temporaryLabel: UILabel!
	func setTemporaryNameForCategory(_ category: Categorie) {
		self.temporaryLabel.text = category.categoria;
	}
    
}
