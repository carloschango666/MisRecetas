//
//  recipe.swift
//  mis recetas
//
//  Created by carlos aguilar hernandez on 24/10/16.
//  Copyright © 2016 carlos aguilar hernandez. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    
 //   var isFavourite: Bool = false
    
    var rating : String = "rating"
    
    
    init(name: String,imagen : UIImage, time : Int, ingredients : [String], steps : [String]) {
        self.name = name
        self.image = imagen
        
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
    
}
