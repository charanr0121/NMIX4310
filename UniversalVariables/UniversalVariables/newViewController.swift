//
//  newViewController.swift
//  UniversalVariables
//
//  Created by Charan Ramachandran on 1/27/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import UIKit

class newViewController: UIViewController {

    @IBOutlet weak var newVar: UITextField!

 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doitplease() {
        topic = "it worked!!"
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
