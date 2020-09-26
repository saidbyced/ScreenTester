//
//  Content.swift
//  ScreenTester
//
//  Created by Chris Eadie on 26/09/2020.
//

import SwiftUI

class Content: ObservableObject {
    @Published var colorNumber = 0
    
    var colorList = TestColor.Option.allCases
    var actionSheetButtons: [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()
        for color in colorList {
            let colorName = color.rawValue.capitalized
            guard let colorNumber = colorList.firstIndex(of: color) else { fatalError() }
            buttons.append(.default(Text(colorName)) { self.colorNumber = colorNumber })
        }
        return buttons
    }
    
    func cycleColor() {
        if colorNumber >= colorList.count - 1 {
            colorNumber = 0
        } else {
            colorNumber += 1
        }
    }
}

