//
//  AddNewMenuItemViewController.swift
//  Restaurants
//
//  Created by Michael P. Rogers on 10/3/19.
//  Copyright © 2019 Bearcat Coders. All rights reserved.
//

import UIKit

class AddNewMenuItemViewController: UIViewController {
    
    var restaurant:Restaurant!
    
    @IBOutlet weak var nameTF:UITextField!
    @IBOutlet weak var caloriesTF: UITextField!
    @IBOutlet weak var sodiumTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "Add New Menu Item"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil)

    }
    
    @objc func add(){
        let menuItem = MenuItem(name: nameTF.text!, calories: Int(caloriesTF.text!)!, sodium: Int(sodiumTF.text!)!)// make a menu item
        restaurant.add(menuItem: menuItem)// add it to this restaurant's menu
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"MenuItem Added"), object: nil)

        self.dismiss(animated: true, completion: nil)
    }
 
}
