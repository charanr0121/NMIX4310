//
//  RemoteImage.swift
//  Midterm
//
//  Created by Charan Ramachandran on 4/2/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

struct RemoteImage: View {
    @ObservedObject var imageLoader = ImageLoader()
    
    var placeholder:Image
    
    init(url: String, placeholder:Image = Image(systemName: "photo")) {
        self.placeholder = placeholder
        imageLoader.fetchImage(url: url)
    }
    
    var body: some View {
        
        if let image = self.imageLoader.downloadImage {
            let x = Image(uiImage: image).resizable()
            return x
        }
        
        return placeholder.resizable()
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(url: "")
    }
}
