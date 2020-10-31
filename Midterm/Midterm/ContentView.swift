//
//  ContentView.swift
//  Midterm
//
//  Created by Charan Ramachandran on 4/2/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

import Foundation
import Combine
struct ContentView: View {
    @State private var showDetails = "x"
    
    @ObservedObject var studentInfo = GetData()
    
    var body: some View {
        VStack {
            NavigationView {
                List(studentInfo.students) {
                    student in
                    NavigationLink(destination:
                        VStack{
                            RemoteImage(url: "https://4310.mynmi.net/students/\(student.name+student.lastName).jpg").aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                            Text(student.fact)
                                .padding()
                                .font(.custom("Avenir", size: 20))
                            HStack{
                                Text(student.name)
                                Text(student.lastName)
                            }.font(.custom("Avenir Black", size: 30))
                        }
                    ) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(student.name)
                                Text(student.lastName)
                            }
                            .font(.custom("Avenir Black", size: 20))
                            .foregroundColor(Color.gray)
                        }
                    }
                }
                .navigationBarTitle("Students")
            }
            HStack{
                Text("Sort by:")
                Button(action: {
                    self.showDetails = "f"
                }) {
                    if self.showDetails == "f" {
                        Text("First Name")
                            .fontWeight(.bold)
                    } else {
                        Text("First Name")
                    }                }
                Button(action: {
                    self.showDetails = "l"
                }) {
                    if self.showDetails == "l" {
                        Text("Last Name")
                            .fontWeight(.bold)
                    } else {
                        Text("Last Name")
                    }
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
            let dataURL = URL(string: "https://4310.mynmi.net/tracker/json.php")!
            let decoder = JSONDecoder()
            URLSession.shared.dataTask(with: dataURL) {(data,response,error) in do
            {
                if let d = data {
                    let decodedLists = try decoder.decode([DataLayout].self, from: d)
                    DispatchQueue.main.async {
                        self.students = decodedLists
                    }
                }else {
                    print("No Data")
                }
            }catch {
                print("Error")
                }
            }.resume()
        }
    }
}
