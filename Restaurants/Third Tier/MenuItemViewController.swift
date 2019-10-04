//
//  NutritionViewController.swift
//  Restaurants
//
//  Created by Michael P. Rogers on 10/3/19.
//  Copyright © 2019 Bearcat Coders. All rights reserved.
//

import UIKit

class MenuItemViewController: UIViewController {
    var menuItem: MenuItem!
    
    @IBOutlet weak var caloriesLBL: UILabel!
    @IBOutlet weak var sodiumLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = menuItem.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        caloriesLBL.text = "\(menuItem.calories)"
        sodiumLBL.text = "\(menuItem.sodium)"
        
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
