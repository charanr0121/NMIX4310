//
//  ImageLoader.swift
//  Midterm
//
//  Created by Charan Ramachandran on 4/2/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader:ObservableObject{
    @Published var downloadImage:UIImage?
    
    func fetchImage(url:String) {
        guard let imageURL = URL(string: url) else {
            fatalError("The url string is invalid")
        }
        URLSession.shared.dataTask(with: imageURL) {data, response, error in
            guard let data = data, error == nil else {
                fatalError("error reading the image")
            }
            
            DispatchQueue.main.async {
                self.downloadImage = UIImage(data: data)
            }
        }.resume()
    }
}
