//
//  ContentView.swift
//  ScreenTester
//
//  Created by Chris Eadie on 26/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var showingColorMenu = false
    @ObservedObject var content = Content()
    
    var body: some View {
        content.color.view
            .ignoresSafeArea()
            .onTapGesture(count: 1, perform: {
                content.cycleColor()
            })
            .onLongPressGesture {
                showingColorMenu.toggle()
            }
            .actionSheet(isPresented: $showingColorMenu, content: {
                ActionSheet(
                    title: Text("Colour options"),
                    message: Text("Choose colour to use for testing the screen"),
                    buttons: content.actionSheetButtons
                )
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
