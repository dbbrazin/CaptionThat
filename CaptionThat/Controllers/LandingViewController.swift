//
//  LandingViewController.swift
//  CaptionThat
//
//  Created by Dane Brazinski on 2/17/20.
//  Copyright © 2020 Dane Brazinski. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var authorLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        authorLabel.text = "dbbrazin@syr.edu"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func showImagePicker() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image"]
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = false
        pickerController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Run everything in defer **last**
        defer { picker.dismiss(animated: true, completion: nil) }
        
        // Retrieve the image I selected
        guard let image = (info[.originalImage] ?? info[.editedImage]) as? UIImage else {
            assertionFailure("Failed to retrieve image after image picker told us an image was picked")
            return
        }
        // Create a Picture instance
        initalizeCaptionView(with: Picture(image: image))
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Do nothing. We have nothing to handle here. Dismiss the picker
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func handleUserDidTapImageGallery(_ sender: UIButton) {
        showImagePicker()
    }
    
    /// Calls the `LandingToCaptionedSegue` with the Picture as an argument
    func initalizeCaptionView(with picture: Picture) {
        /// make sure identifier matches the value you set in  Main.Storyboard
        self.performSegue(withIdentifier: "LandingToCaptionSegue", sender: picture)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! CaptionedViewController
        if let pic = sender as? Picture {
            destVC.newPic = pic
        } else {
            print("error")
        }
        
    }

}
