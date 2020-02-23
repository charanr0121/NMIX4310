//
//  ContentView.swift
//  Homework Arc
//
//  Created by Charan Ramachandran on 2/23/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var degrees: Double = 0
    var body: some View {
        VStack{
            Path { path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 360-degrees), clockwise: true)
            }
                .fill(Color.green)
            Slider(value: $degrees, in: 0...359, step: 1.0)
                .padding()
            Text(String(Int(degrees)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
