//
//  CategoriesViewController.swift
//  Zan
//
//  Created by Alessandro Santos Pinto on 03/10/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import UIKit
import SideMenu

class CategoriesViewController: UIViewController {
	
	var categories = [Categorie]()
	@IBOutlet weak var categoriesCollectionView: UICollectionView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Menu") as! MenuViewController
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: viewController)
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        SideMenuManager.default.menuFadeStatusBar = false

//        let api = ConnectionController()
//        api.loadCategories { [weak self] (categories) in
//            self?.categories = categories;
//            self?.categoriesCollectionView.reloadData()
//        }
    }
	
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return categories.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CategoryCell
//        let category = categories[indexPath.row]
//        cell.setTemporaryNameForCategory(category)
//        return cell
//    }
    
    var categorie: String = ""
    
    @IBAction func sendOrViewVideo(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            categorie = "LOVE"
            
        case 1:
            categorie = "SMOKE"
            
        case 2:
            categorie = "GYM"
            
        case 3:
            categorie = "DRUGS"
            
        case 4:
            categorie = "HEALTH"
            
        case 5:
            categorie = "DRINK"
            
        default:
            categorie = "UNKNOWN"
        }
        
        performSegue(withIdentifier: "videos", sender: nil)
    }
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //  if segue.identifier == "videos" {
        //    let destination = segue.destination as! SendAndReceiveVideoViewController
          //  destination.categorie = categorie
        //}
    //}
    
    @IBAction func showMenu(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
}
