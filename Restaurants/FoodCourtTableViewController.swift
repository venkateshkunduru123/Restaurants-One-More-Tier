//
//  RestaurantTableViewController.swift
//  Restaurants
//
//  Created by Michael Rogers on 9/23/19.
//  Copyright © 2019 Bearcat Coders. All rights reserved.
//

import UIKit

class FoodCourtTableViewController: UITableViewController {

    let rowHeight:CGFloat = 60.0
    
    let bigLabelTag = 100
    let littleLabelTag = 200
    let imageViewTag = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Restaurants of Maryville!"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Restaurants", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
        NotificationCenter.default.addObserver(self, selector: #selector(restaurantAdded), name: NSNotification.Name(rawValue:"Restaurant Added"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("In viewWillAppear(_:)")
    }
    
    @objc func restaurantAdded(notification:Notification){
        tableView.reloadData()
    }
    
    @objc func add(){
        let navCon = storyboard?.instantiateViewController(withIdentifier: "addNewRestaurantNavCon")
        
        self.present(navCon!, animated: true, completion: nil)
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoodCourt.shared.numRestaurants()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurant_custom", for: indexPath)

        // Configure the cell...
        
        let restaurant = FoodCourt.shared[indexPath.row]
        
        let bigLabel = cell.viewWithTag(bigLabelTag) as! UILabel
        let littleLabel = cell.viewWithTag(littleLabelTag) as! UILabel
        let imageView = cell.viewWithTag(imageViewTag) as! UIImageView
        
        bigLabel.text = restaurant.name
        littleLabel.text = restaurant.hours
        imageView.image = UIImage(named:restaurant.name)
//        cell.textLabel?.text = restaurant.name
//        cell.detailTextLabel?.text = restaurant.hours
//        cell.imageView?.image = UIImage(named:restaurant.name)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. Instantiate a MenuTableViewController
        let menuTVC = storyboard!.instantiateViewController(withIdentifier: "MenuTableViewController") as! MenuTableViewController
        
        // 2. Configure its Restaurant
        
        menuTVC.restaurant = FoodCourt.shared[indexPath.row]
        // 3. Push it on to the navigation controller's stack
        
        self.navigationController!.pushViewController(menuTVC, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            FoodCourt.shared.deleteRestaurant(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
