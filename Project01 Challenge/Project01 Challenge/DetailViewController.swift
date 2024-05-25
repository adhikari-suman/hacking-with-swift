//
//  DetailViewController.swift
//  Project01 Challenge
//
//  Created by Suman Adhikari on 5/25/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var selectedPicture: UIImageView!
    
    var currentPicture:String?
    var x:Int?
    var y:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        title = "Picture \(x ?? -1) of \(y ?? -1)"
        
        if let pictureToLoad = currentPicture {
            selectedPicture.image = UIImage(named: pictureToLoad)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
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
