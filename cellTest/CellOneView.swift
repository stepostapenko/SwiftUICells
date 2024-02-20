//
//  CellOneView.swift
//  cellTest
//
//  Created by Stepan Ostapenko on 20.02.2024.
//

import Foundation
import SwiftUI

struct CellOneView: View {
    let koefOne: Float
    let valueOne: Float
    let koefTwo: Float
    let valueTwo: Float
    let koefThree: Float
    let valueThree: Float
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Средние коэффициенты")
                .fontWeight(.semibold)
            
            CellProgressRow(text: "Выигрыш", value: valueOne,
                            color: Color("CellGreen"), koeff: koefOne)
            CellProgressRow(text: "Проигрыш", value: valueTwo,
                            color: Color("CellRed"), koeff: koefTwo)
            CellProgressRow(text: "Возврат", value: valueThree,
                            color: Color("CellGray"), koeff: koefThree)
        }
        .padding()
        .frame(
            minWidth: 320, minHeight: 100, maxHeight: 130,
            alignment: .topLeading
        )
        .overlay(Rectangle()
            .stroke(Color.gray,
                    lineWidth: 3))
    }
    
    func CellProgressRow(text: String,
                         value: Float,
                         color: Color,
                         koeff: Float) -> some View {
        
        GeometryReader { proxy in
            HStack(alignment: .center) {
                ProgressView(value: value)
                    .frame(
                        width: proxy.size.width * 0.62
                    )
                    .accentColor(color)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                Text(text)
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 13))
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                Spacer()
                Text(String(format: "%.1f", koeff))
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
            }
        }
    }
}
