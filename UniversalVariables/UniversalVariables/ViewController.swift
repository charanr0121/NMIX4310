//
//  ViewController.swift
//  UniversalVariables
//
//  Created by Charan Ramachandran on 1/27/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        myLabel.text = topic
    }

    @IBAction func newb(_ sender: Any) {
        myLabel.text = "the text is visible"
    }
    
}

