//
//  ViewController.swift
//  AccessingTheCamera2
//
//  Created by Brandi Freeman on 7/14/20.
//  Copyright © 2020 Brandi Freeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    
    @IBOutlet var hyperlinkTapped: UITextView!
    
    
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        let attributedString = NSMutableAttributedString(string: "Want to learn iOS? You should visit the best source of free iOS tutorials!")
        attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: 19, length: 55))
        
        hyperlinkTapped.attributedText = attributedString
    }
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
           UIApplication.shared.open(URL)
           return false
       }

    @IBAction func takeSelfieTapped(_ sender: UIButton) {

        imagePicker.sourceType = .camera

        present(imagePicker, animated: true, completion: nil)

    }

    @IBAction func photoLibraryTapped(_ sender: UIButton) {

        imagePicker.sourceType = .photoLibrary

        present(imagePicker, animated: true, completion: nil)

    }

    @IBOutlet weak var displayImage: UIImageView!

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        // update our photo with the selected photo

        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            displayImage.image = selectedImage
        }

        // go back to our ViewContoller
        imagePicker.dismiss(animated: true, completion: nil)

    }
}
//
