//
//  AddNewRestaurantViewController.swift
//  Restaurants
//
//  Created by Michael Rogers on 10/2/19.
//  Copyright © 2019 Bearcat Coders. All rights reserved.
//

import UIKit

class AddNewRestaurantViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var hoursTF: UITextField!
    
    @IBOutlet weak var menuItemsTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add New Restaurant"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func add(){
        
        let name = nameTF.text
        let hours = hoursTF.text
        
        let restaurant = Restaurant(name: name!, hours: hours!, menu:[])
        FoodCourt.shared.add(restaurant: restaurant)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"Restaurant Added"), object: nil)
        self.dismiss(animated: true, completion: nil)
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
