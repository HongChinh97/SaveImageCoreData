//
//  ViewController.swift
//  SaveImageCoreData
//
//  Created by admin on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var entity: [Images]?
    
    @IBOutlet weak var imageView: UIImageView!{
        didSet{
            imageView.image = UIImage(named: "images")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let entity = try? (AppDelegate.context.fetch(Images.fetchRequest())) as [Images], !entity.isEmpty {
            imageView.image = entity.last?.picture
        }
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        imageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        guard imageView.image != nil else {
            return
        }
        let context = Images(context: AppDelegate.context)
        context.picture = imageView.image
        AppDelegate.saveContext()
    }
    
}
