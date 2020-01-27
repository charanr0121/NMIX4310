//
//  ViewController.swift
//  Picture Segue
//
//  Created by Charan Ramachandran on 1/27/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passedPic = segue.destination as! displayPix
        if segue.identifier == "segue1"{
            passedPic.picChosen = "beach.jpg"
        }
        if segue.identifier == "segue2"{
            passedPic.picChosen = "bigboy.jpg"
        }
        if segue.identifier == "segue3"{
            passedPic.picChosen = "tree.jpg"
        }
        if segue.identifier == "segue4"{
            passedPic.picChosen = "butterfly.jpg"
        }
    }

}

