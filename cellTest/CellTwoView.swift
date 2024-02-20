//
//  CellTwoView.swift
//  cellTest
//
//  Created by Stepan Ostapenko on 20.02.2024.
//

import Foundation
import SwiftUI

struct CellTwoView: View {
    let wins: Int
    let loses: Int
    let returns: Int
    
    func getPercent(for value: Int) -> CGFloat {
        return CGFloat(value)/CGFloat(wins+loses+returns)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text("Выигрыши/проигрыши по букмекерам")
                    .font(.system(size: 16, weight: .bold))
                
                HStack(alignment: .bottom) {
                    Image("hill")
                        .resizable()
                        .scaledToFit()
                
                    Text("\(wins + loses + returns) ставки")
                        .font(.system(size: 15, weight: .semibold))
                    Spacer()
                }
                
                HStack(spacing: 0) {
                    diagramComponent(width: proxy.size.width,
                                     value: wins,
                                     color: Color("CellGreen"))
                    Spacer()
                    diagramComponent(width: proxy.size.width,
                                     value: loses,
                                     color: Color("CellRed"))
                    Spacer()
                    diagramComponent(width: proxy.size.width,
                                     value: returns,
                                     color: Color("CellGray"),
                                     alignment: .trailing)
                }
                .frame(maxHeight: 20)
                .padding(.top, 10)
            }.frame(minWidth: 320)
        }
        .padding()
        .frame(minWidth: 360, maxHeight: 220)
        .overlay(Rectangle()
            .stroke(Color.gray,
                    lineWidth: 3))
    }
    
    func diagramComponent(width: CGFloat,
                          value: Int,
                          color: Color,
                          alignment: HorizontalAlignment = .leading) -> some View {
        let percent = getPercent(for: value)
        let percentText = Int(round(percent*100))
        return VStack(alignment: alignment) {
            Spacer()
            RoundedRectangle(cornerSize: CGSize(width: 1, height: 10))
                .frame(width: width * percent*0.97,
                       height: 8)
                .foregroundStyle(color)
            Text("\(value.description) (\(percentText)%)")
                .font(.system(size: 11, weight: .semibold))
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

