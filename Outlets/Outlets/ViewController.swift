//
//  ViewController.swift
//  Outlets
//
//  Created by Charan Ramachandran on 1/27/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showImage: UIImageView!
    @IBAction func myButton() {
        showImage.image = UIImage(named: "bigboy.jpg")
    }
    @IBAction func myButton2() {
        showImage.image = UIImage(named: "beach.jpg")
    }
    @IBAction func myButton3() {
        showImage.image = UIImage(named: "butterfly.jpg")
    }
    @IBAction func myButton4() {
        showImage.image = UIImage(named: "tree.jpg")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

