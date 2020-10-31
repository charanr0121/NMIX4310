// ContentView.swift
// olivia
//
// Created by Emuela on 3/30/20.
// Copyright © 2020 Emuela. All rights reserved.
//
import SwiftUI
import Foundation
import Combine
struct ContentView: View {
 @ObservedObject var catInfo = GetData()
 var body: some View {
 //  Text("\(catInfo.cats[0].image)")
  List(catInfo.cats) { cat in
   HStack {
    Text(cat.image)
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
 public var image: String
 public var id: String
 enum CodingKeys: String, CodingKey{
  case id = "id"
  case image = "url"
 }
}
public class GetData: ObservableObject{
 @Published var cats = [DataLayout]()
 init(){
  load()
 }
 func load() {
  let dataUrl = URL(string: "https://api.thecatapi.com/v1/images/search?api_key=79279922-c948-44b2-a158-81cb9ea5a57a")!
  let decoder = JSONDecoder()
  URLSession.shared.dataTask(with: dataUrl) {(data,response,error) in
   do {
    if let d = data {
     let decodedLists = try decoder.decode([DataLayout].self, from: d)
     DispatchQueue.main.async {
      self.cats = decodedLists
      print(self.cats[0].image)
     }
    }else {
     print("No Data")
    }
   } catch {
    print ("Error")
   }
  }.resume()
 }
}
