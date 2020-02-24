//
//  ContentView.swift
//  ClassJSon
//
//  Created by Charan Ramachandran on 2/24/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

struct ContentView: View {
    @ObservedObject var studentInfo = GetData()
    var body: some View {
        List(studentInfo.students) {
            student in
            VStack(alignment: .leading){
                Text(student.name + " " + student.lastName)
                    .font(.largeTitle)

                Text(student.fact)
                    .font(.body)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DataLayout: Codable, Identifiable {
    public var id: String
    public var name: String
    public var lastName: String
    public var fact: String
    
    enum CodingKeys: String, CodingKey {
        case id = "counter"
        case name = "stu_name"
        case lastName = "last_name"
        case fact = "fact"
    }
}

public class GetData: ObservableObject {
    @Published var students = [DataLayout]()
    init() {
        load()
    }
    func load() {
        let dataUrl = URL(string: "https://4310.mynmi.net/tracker/json.php")!
        let decoder = JSONDecoder()
        URLSession.shared.dataTask(with: dataUrl) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try decoder.decode([DataLayout].self, from: d)
                    DispatchQueue.main.async {
                        self.students = decodedLists
                    }
                } else {
                    print("No Data")
                }
            } catch {
                print("Error")
            }
        }
        .resume()
    }
}
