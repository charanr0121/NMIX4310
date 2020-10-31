//
//  ContentView.swift
//  Covid19
//
//  Created by Charan Ramachandran on 4/24/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI
import SwiftUICharts
import Foundation

var a:[Double] = [0.0] //array of case numbers
var txt:String = "india" //initial
var title:String = "India" //initial

var countries:[[String]] = [["",""],["",""]]

struct ContentView: View {
    
    @ObservedObject var countriesList = GetData1()
    @ObservedObject var initialGraph = GetData()
    
    var body: some View {
            NavigationView{
                VStack{
                    List(countries, id: \.self) { country in
                        NavigationLink(destination:
                            GraphView(country: country)
                            .onAppear{
                                txt = country[1]
                                title = country[0]
                                GetData()
                            }
                        ) {
                            Text(country[0])
                        } //end NavigationLink
                    }
                    .navigationBarTitle("Countries")
                    .navigationBarItems(trailing:
                        Button("Help") {
                            print("Help tapped!")
                        }
                    )
                }//end vstack
            } //end NavigationView
    }
}

struct GraphView: View {
    @State public var country:[String] = ["",""]

    var body: some View {
        VStack{
            LineView(data: a, title: title, legend: "Daily Cases")
                .padding()
        }
    }
}

struct DataLayout: Codable, Identifiable {
    public var id: String
    public var country: String
    public var cases: Int
    enum CodingKeys: String, CodingKey {
        case id = "Date"
        case country = "Country"
        case cases = "Cases"
    }
}

public class GetData: ObservableObject {
    @Published var info = [DataLayout]()
    var plsWork:String = txt
    init() {
        load(countrySlug: plsWork)
    }
    func load(countrySlug: String) {
        let dataURL = URL(string: "https://api.covid19api.com/country/\(countrySlug)/status/confirmed")!
        //print(dataURL)
        let decoder = JSONDecoder()
        URLSession.shared.dataTask(with: dataURL) {(data,response,error) in do
        {
            if let d = data {
                let decodedLists = try decoder.decode([DataLayout].self, from: d)
                DispatchQueue.main.async {
                    self.info = decodedLists
                    // print(self.info)
                    a.removeAll()
                    for element in self.info {
                        //print(element.cases)
                        a.append(Double(element.cases))
                    }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DataLayout1: Codable, Identifiable {
    public var id: String
    public var name: String
    public var slug: String
    enum CodingKeys: String, CodingKey {
        case id = "ISO2"
        case name = "Country"
        case slug = "Slug"
    }
}

public class GetData1: ObservableObject {
    @Published var info = [DataLayout1]()
    init() {
        load()
    }
    func load() {
        let dataURL = URL(string: "https://api.covid19api.com/countries")!
        //print(dataURL)
        let decoder = JSONDecoder()
        URLSession.shared.dataTask(with: dataURL) {(data,response,error) in do
        {
            if let d = data {
                let decodedLists = try decoder.decode([DataLayout1].self, from: d)
                DispatchQueue.main.async {
                    self.info = decodedLists
                    // print(self.info)
                    countries.removeAll()
                    for element in self.info {
                        var x = [element.name, element.slug]
                        countries.append(x)
                    }
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
