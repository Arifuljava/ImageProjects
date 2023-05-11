//
//  ViewController.swift
//  ImageProjects
//
//  Created by sang on 20/10/1444 AH.
//

import UIKit
import Foundation
import Photos


class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet var pickImage: UIView!
    @IBOutlet weak var imageView: UIImageView!
    var imagePickercontroller  = UIImagePickerController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectImage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            print("Button Clicked")
            imagePickercontroller.delegate = self
            imagePickercontroller.sourceType = .savedPhotosAlbum
            imagePickercontroller.allowsEditing = false
            present(imagePickercontroller,animated: true,completion: nil)
            
        }
            
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
               imageView.contentMode = .scaleAspectFill
               imageView.image = pickedImage
            let imageUri = info[.imageURL] as? URL
            
         
            
            
        
           
           
            let stringValue = String(describing: imageUri)
            print(stringValue)
        
            let urlString = URL(string: stringValue)
            let name = urlString?.lastPathComponent
            print("image \n\n\n")
            print(name)
         
            let imageData: Data = pickedImage.jpegData(compressionQuality: 0.4) ?? Data()
            let encodedImage: String = imageData.base64EncodedString()
         // print("Encoding Uri : \n\n\n")
           //print(encodedImage)
            let imagePath = String(describing: imageUri)
            
            

           // print(imagePath)
            
          //  print(pickedImage)
            
            let imagegPath = "/path/to/your/image.jpg"

            if let image = UIImage(contentsOfFile: imagePath) {
                // Use the image object here
                // For example, you can display it in an image view:
                let imageView = UIImageView(image: image)
                
                // Add the imageView to your view hierarchy
            } else {
                // Failed to load the image
                print("Failed to load image from file path: \(imagePath)")
            }
           }
           //self.dismiss(animated: true)
        self.dismiss(animated: true)
        
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Image picked declined")
    }
}


