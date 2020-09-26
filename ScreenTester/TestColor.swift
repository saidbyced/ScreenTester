//
//  TestColor.swift
//  ScreenTester
//
//  Created by Chris Eadie on 26/09/2020.
//

import SwiftUI

struct TestColor {
    
    enum Option: String, CaseIterable {
        case black, white, red, green, blue, yellow, magenta, cyan
    }
    
    var name: String
    var view: Color
    
    init(_ name: Option) {
        self.name = name.rawValue.capitalized
        
        var color: Color {
            switch name {
                case .black:
                    return Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1)
                case .white:
                    return Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
                case .red:
                    return Color(.sRGB, red: 1, green: 0, blue: 0, opacity: 1)
                case .green:
                    return Color(.sRGB, red: 0, green: 1, blue: 0, opacity: 1)
                case .blue:
                    return Color(.sRGB, red: 0, green: 0, blue: 1, opacity: 1)
                case .yellow:
                    return Color(.sRGB, red: 1, green: 1, blue: 0, opacity: 1)
                case .magenta:
                    return Color(.sRGB, red: 1, green: 0, blue: 1, opacity: 1)
                case .cyan:
                    return Color(.sRGB, red: 0, green: 1, blue: 1, opacity: 1)
            }
        }
        
        self.view = color
    }
    
}

