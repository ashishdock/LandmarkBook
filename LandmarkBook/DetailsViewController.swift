//
//  DetailsViewController.swift
//  LandmarkBook
//
//  Created by Ashish Sharma on 12/22/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    var viewTitle = ""
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectedLandmarkImage
        self.navigationItem.title = viewTitle
        
        self.navigationItem.leftItemsSupplementBackButton = true
        landmarkLabel.text = viewTitle
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
