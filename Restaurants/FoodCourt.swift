//
//  Restaurants.swift
//  Restaurants
//
//  Created by Michael Rogers on 9/25/19.
//  Copyright © 2019 Bearcat Coders. All rights reserved.
//

import Foundation


struct MenuItem {
    var name: String
    var calories:Int
    var sodium: Int
    // other properties omitted .. this is just a demo
}

class Restaurant {
    var name:String!
    var hours:String!
    var menu:[MenuItem] = []
    
    init(name:String, hours:String, menu:[MenuItem] = []){
        self.name = name
        self.hours = hours
        self.menu = menu
    }
    // just a convenience so we can access each restaurant's menu more easily
    subscript (i:Int) -> MenuItem {
        return menu[i]
    }
    
    func add(menuItem:MenuItem){
        menu.append(menuItem)
    }
    
    func removeMenuItem(at index:Int){
        menu.remove(at: index)
    }
    
    
}

class FoodCourt {
    
    private static var _shared:FoodCourt!
    static var shared:FoodCourt {
        if _shared == nil {
            _shared = FoodCourt()
        }
        return _shared
    }
    
    private init(){}
    
    subscript(i:Int) -> Restaurant {
        return restaurants[i]
    }
    
    func numRestaurants() -> Int {
        return restaurants.count
    }
    
    private var restaurants = [
        Restaurant(name: "Jimmy John's", hours: "8AM-12AM", menu:[MenuItem(name: "#6", calories: 400, sodium: 200), MenuItem(name: "#8", calories: 800, sodium: 500)]),
        Restaurant(name: "Applebee's", hours: "10AM-12AM", menu:[MenuItem(name: "Salad", calories: 25, sodium: 0)]),
        Restaurant(name: "Subway", hours:"9AM-11PM", menu:[MenuItem(name: "Veggie Patty", calories: 300, sodium: 50)])
    ]
    
    func add(restaurant:Restaurant){
        restaurants.append(restaurant)
    }
    
    func deleteRestaurant(index:Int) {
        restaurants.remove(at: index)
    }
    
}
