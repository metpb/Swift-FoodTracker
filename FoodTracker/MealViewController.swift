//
//  ViewController.swift
//  FoodTracker
//
//  Created by Prasanna Pegu on 11/01/16.
//  Copyright © 2016 Prasanna Pegu. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	// MARK: Properties
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var ratingControl: RatingControl!
	@IBOutlet weak var saveButton: UIBarButtonItem!

	var meal: Meal?

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let urlConfig = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("bgs")
		urlConfig.sessionSendsLaunchEvents = true
		urlConfig.discretionary = true
		
		nameTextField.delegate = self
		
		if let meal = meal {
			navigationItem.title = meal.name
			nameTextField.text = meal.name
			photoImageView.image = meal.photo
			ratingControl.rating = meal.rating
		}

		checkValidMealName() // Make sure the user enters a valid name
	}
	
	
	// MARK: UITextFieldDelegate
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		
		return true
	}
	
	func textFieldDidEndEditing(textField: UITextField) {
		
		checkValidMealName()
		navigationItem.title = textField.text
	}
	
	func textFieldDidBeginEditing(textField: UITextField) {
		saveButton.enabled = false
	}
	
	func checkValidMealName() {
		let text = nameTextField.text ?? ""
		saveButton.enabled = !text.isEmpty
	}
	
	// MARK: UIImagePickerControllerDelegate
	func imagePickerControllerDidCancel(picker: UIImagePickerController) {
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
		let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
		photoImageView.image = selectedImage
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	
	// MARK: Navigation
	@IBAction func cancel(sender: UIBarButtonItem) {
		
		let isPresentingInMealMode = presentingViewController is UINavigationController
		
		if isPresentingInMealMode {
			dismissViewControllerAnimated(true, completion: nil)
		}
		else {
			navigationController!.popViewControllerAnimated(true)
		}
		
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if saveButton === sender {
			
			let name = nameTextField.text ?? ""
			let photo = photoImageView.image
			let rating = ratingControl.rating
			
			meal = Meal(name: name, rating: rating, photo: photo)
			
		}
		
	}
	
	
	// MARK: Actions

	@IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
		// Hide the keyboard
		nameTextField.resignFirstResponder()
		
		let imagePickerController = UIImagePickerController()
		
		// Picks an image from Photo Library, doesn't takes
		imagePickerController.sourceType = .PhotoLibrary
		
		// Make sure ViewController is notified when the user picks an image.
		imagePickerController.delegate = self
		
		presentViewController(imagePickerController, animated: true, completion: nil)
	}
	
}

