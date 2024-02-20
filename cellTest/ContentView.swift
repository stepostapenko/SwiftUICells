//
//  ContentView.swift
//  cellTest
//
//  Created by Stepan Ostapenko on 19.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
           
            VStack {
                CellOneView(koefOne: 0.3, valueOne: 0.3, 
                            koefTwo: 0.6, valueTwo: 0.7,
                            koefThree: 0.5, valueThree: 0.8).frame(height: 120)
 
                CellTwoView(wins: 16, loses: 11, returns: 5).frame(height: 120)
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
