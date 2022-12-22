//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Ashish Sharma on 12/22/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmark = ""
    var chosenLandmarkImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Golden Gate Bridge")
        landmarkNames.append("Sydney Harbor")
        landmarkNames.append("Empire State Building")
        landmarkNames.append("Hawa Mahal")
        landmarkNames.append("Petronas Towers")
        
        
        landmarkImages.append(UIImage(named: "Golden Gate Bridge")!)
        landmarkImages.append(UIImage(named: "Sydney Harbor")!)
        landmarkImages.append(UIImage(named: "Empire State")!)
        landmarkImages.append(UIImage(named: "HawaMahal")!)
        landmarkImages.append(UIImage(named: "Petronas")!)
        
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        content.secondaryText = " Secondary Text"
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmark = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.viewTitle = chosenLandmark
            destinationVC.selectedLandmarkName = chosenLandmark
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
    
    

}

