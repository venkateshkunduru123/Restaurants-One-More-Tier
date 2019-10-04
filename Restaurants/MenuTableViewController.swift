//
//  MenuTableViewController.swift
//  Restaurants
//
//  Created by Michael Rogers on 9/30/19.
//  Copyright © 2019 Bearcat Coders. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(menuItemAdded), name: NSNotification.Name(rawValue:"MenuItem Added"), object: nil)
    }
    
    @objc func menuItemAdded(notification:Notification){
        //tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = restaurant.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        print("In viewWillAppear(_:)")
        tableView.reloadData()
    }
    
    @objc func add(){
        let addNewMenuItemVC = storyboard?.instantiateViewController(withIdentifier: "AddNewMenuItemVCNavCon") as! UINavigationController
        (addNewMenuItemVC.topViewController as! AddNewMenuItemViewController).restaurant = restaurant
        self.present(addNewMenuItemVC, animated: true, completion: nil)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurant.menu.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItem", for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = restaurant.menu[indexPath.row].name
        return cell
    }
    
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let menuItemVC = storyboard?.instantiateViewController(withIdentifier: "MenuItemVC") as! MenuItemViewController
            menuItemVC.menuItem = restaurant.menu[indexPath.row]
            navigationController?.pushViewController(menuItemVC, animated: true)
    }
 
 
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           restaurant.removeMenuItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

}
