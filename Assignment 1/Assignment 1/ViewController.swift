//
//  ViewController.swift
//  Assignment 1
//
//  Created by Charan Ramachandran on 2/2/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passedPics = segue.destination as! Pics
        if segue.identifier == "desserts" {
            passedPics.picArray = 0
        if segue.identifier == "cars" {
            passedPics.picArray = 0
        }
    }

}

}
