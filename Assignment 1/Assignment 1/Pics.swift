//
//  Pics.swift
//  Assignment 1
//
//  Created by Charan Ramachandran on 2/2/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import UIKit

class Pics: UIViewController {

    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet var label: UILabel!
    
    var picArray:Int = 3
    var index = 0
    var arrayChosen = ["default"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (picArray == 0){
            arrayChosen = ["cookies.jpg", "pie.jpg", "cake.jpg"]
        } else {
            arrayChosen = ["gtr.jpg","porsche.jpg","benz.jpg"]
        }
        viewImage.image = UIImage(named: arrayChosen[0])
        label.text = arrayChosen[0]
        // Do any additional setup after loading the view.
    }
    @IBAction func nextButton() {
        index+=1
        if (index == 3) {
            index = 0
        }
        viewImage.image = UIImage(named: arrayChosen[index])
        label.text = arrayChosen[index]
    }
    @IBAction func prevButton() {
        index-=1
        if (index == -1) {
            index = 2
        }
        viewImage.image = UIImage(named: arrayChosen[index])
        label.text = arrayChosen[index]
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
