//
//  Meal.swift
//  FoodTracker
//
//  Created by Prasanna Pegu on 12/01/16.
//  Copyright © 2016 Prasanna Pegu. All rights reserved.
//

import UIKit

class Meal {
	
	// MARK: Properties
	
	var name: String
	var rating: Int
	var photo: UIImage?
	

	
	// MARK: Initialization
	
	init?(name: String, rating: Int, photo: UIImage?) {
		self.name = name
		self.rating = rating
		self.photo = photo
		
		if name.isEmpty || rating < 0 {
			return nil
		}
	}
	
}
