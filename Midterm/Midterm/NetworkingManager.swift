//
//  NetworkingManager.swift
//  Midterm
//
//  Created by Charan Ramachandran on 4/2/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Foundation

class NetworkingManager : ObservableObject{
    var didChange = PassthroughSubject<NetworkingManager, Never>()
    
    var studentList = StudentAPIList(results: []) {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: "https://4310.mynmi.net/tracker/json.php") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let studentList = try! JSONDecoder().decode(StudentAPIList.self, from: data)
            
            DispatchQueue.main.async {
                self.studentList = studentList
            }
        }.resume()
    } 
}

struct NetworkingManager_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
