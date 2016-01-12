//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Prasanna Pegu on 11/01/16.
//  Copyright © 2016 Prasanna Pegu. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
	// MARK: Food Tracker Tests
	
	func testMealInitialization() {
		
		// Success cases
		let potentialItem = Meal(name: "Chicken Teriyaki Salad", rating: 4, photo: nil)
		XCTAssertNotNil(potentialItem, "Meal initializes as expected when there's no photo.")
		
		
		// Failure cases
		let potentialItemWithNoName = Meal(name: "", rating: 3, photo: nil)
		XCTAssertNil(potentialItemWithNoName, "Empty name is invalid, as expected.")
		
		let badRating = Meal(name: "Bad salad", rating: -1, photo: nil)
		XCTAssertNil(badRating, "Negative ratings are harmful, be positive.")
		
		
	}
	
}
