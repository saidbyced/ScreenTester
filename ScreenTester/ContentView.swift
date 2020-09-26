//
//  ContentView.swift
//  ScreenTester
//
//  Created by Chris Eadie on 26/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var colorNumber = 0
    private var colorList = [
        Color.black,
        Color.white,
        // Red
        Color(.sRGB, red: 1, green: 0, blue: 0, opacity: 1),
        // Green
        Color(.sRGB, red: 0, green: 1, blue: 0, opacity: 1),
        // Blue
        Color(.sRGB, red: 0, green: 0, blue: 1, opacity: 1),
        // Yellow
        Color(.sRGB, red: 1, green: 1, blue: 0, opacity: 1),
        // Magenta
        Color(.sRGB, red: 1, green: 0, blue: 1, opacity: 1),
        // Cyan
        Color(.sRGB, red: 0, green: 1, blue: 1, opacity: 1)
    ]
    
    var body: some View {
        colorList[colorNumber]
            .ignoresSafeArea()
            .onTapGesture(count: 1, perform: {
                if colorNumber >= colorList.count - 1 {
                    colorNumber = 0
                } else {
                    colorNumber += 1
                }
            })
            .onLongPressGesture {
                colorNumber = 0
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
