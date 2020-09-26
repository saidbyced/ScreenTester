//
//  Content.swift
//  ScreenTester
//
//  Created by Chris Eadie on 26/09/2020.
//

import SwiftUI

class Content: ObservableObject {
    @Published var color = TestColor(.black)
    
    private var colorNumber = 0
    private var colorList = TestColor.Option.allCases
    var actionSheetButtons: [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()
        for color in colorList {
            let colorName = color.rawValue.capitalized
            guard let colorNumber = colorList.firstIndex(of: color) else { fatalError() }
            buttons.append(.default(Text(colorName)) { self.selectColor(colorNumber) })
        }
        return buttons
    }
    
    func cycleColor() {
        if colorNumber >= colorList.count - 1 {
            colorNumber = 0
        } else {
            colorNumber += 1
        }
        
        color = TestColor(colorList[colorNumber])
    }
    
    func selectColor(_ colorNumber: Int) {
        color = TestColor(colorList[colorNumber])
    }
}
