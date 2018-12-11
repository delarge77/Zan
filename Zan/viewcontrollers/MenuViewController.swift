//
//  MenuViewController.swift
//  Zan
//
//  Created by Alessandro dos Santos Pinto on 28/11/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    let options = ["Logout","Settings","Messages","Contact","FAQ"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = options[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let destination = segue.destination as? MenuOptionViewController
            destination?.menuOption = options[indexPath.row]
        }
    }

}
