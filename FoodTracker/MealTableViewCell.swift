//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Prasanna Pegu on 12/01/16.
//  Copyright © 2016 Prasanna Pegu. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
	
	// MARK: Properties
	@IBOutlet weak var mealLabel: UILabel!
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var ratingControl: RatingControl!
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
