//
//  CaptionedViewController.swift
//  CaptionThat
//
//  Created by Dane Brazinski on 2/17/20.
//  Copyright © 2020 Dane Brazinski. All rights reserved.
//

import UIKit

class CaptionedViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var newPic: Picture!
    var captions = [Caption(text: "I am serious. And don't call me Shirley"),
                    Caption(text: "I'm about to do to you what Limp Bizkit\n did to music in the late '90s."),
                    Caption(text: "I'm in a glass case of emotion!"),
                    Caption(text: "I'll have what she's having."),
                    Caption(text: "Nothing to see here, move along")]
    
    
    override func loadView() {
        super.loadView()
        userImageView.image = newPic.image
        captionLabel.text = randomCaption()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func randomCaption() -> String {
        guard let caption = captions.randomElement() else {
            assertionFailure("Caption should not be nil")
            return ""
        }
        return caption.text
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
