//
//  displayPix.swift
//  Picture Segue
//
//  Created by Charan Ramachandran on 1/27/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import UIKit

class displayPix: UIViewController {
    var picChosen = "beach.jpg"
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: picChosen)
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
