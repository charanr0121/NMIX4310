//
//  ViewController.swift
//  segueDemo
//
//  Created by Charan Ramachandran on 1/27/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var testVar = "it worked!"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiverView = segue.destination as! SegueViewController
        if segue.identifier == "segue1"{
            receiverView.passedIt = "first button"
        }
        if segue.identifier == "segue2"{
            receiverView.passedIt = "second button"
        }
        if segue.identifier == "segue3"{
            receiverView.passedIt = "third button"
        }
    }

}

