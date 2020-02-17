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
    var newPic: Picture!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        userImageView.image = newPic.image
        captionLabel.text = "New Caption"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
