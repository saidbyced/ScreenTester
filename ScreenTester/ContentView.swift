//
//  ContentView.swift
//  ScreenTester
//
//  Created by Chris Eadie on 26/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var colorNumber = 0
    @State private var showingColorMenu = false
    private var colorList = TestColor.Option.allCases
    private var actionSheetButtons: [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()
        for color in colorList {
            let colorName = color.rawValue.capitalized
            guard let colorNumber = colorList.firstIndex(of: color) else { fatalError() }
            buttons.append(.default(Text(colorName)) { self.colorNumber = colorNumber })
        }
        return buttons
    }
    
    var body: some View {
        TestColor(colorList[colorNumber]).view
            .ignoresSafeArea()
            .onTapGesture(count: 1, perform: {
                nextColor()
            })
            .onLongPressGesture {
                showingColorMenu.toggle()
            }
            .actionSheet(isPresented: $showingColorMenu, content: {
                ActionSheet(
                    title: Text("Colour options"),
                    message: Text("Choose colour to use for testing the screen"),
                    buttons: actionSheetButtons
                )
            })
    }
    
    func nextColor() {
        if colorNumber >= colorList.count - 1 {
            colorNumber = 0
        } else {
            colorNumber += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
