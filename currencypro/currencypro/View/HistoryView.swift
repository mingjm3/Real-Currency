//
//  HistoryView.swift
//  currencypro
//
//  Created by Mingjun Ma on 11/16/22.
//

import SwiftUI
import Charts

struct HistoryView: View {
    
    let symbol: String

    var body: some View {
        let today: String = getTodayDate()
        let data: [Point] = Bundle.main.getHistoryRates("2022-11-08", today, defaultCurrency, symbol)!
        let minPoint: Point = data.min {p1, p2 in p1.rate < p2.rate}!
        let maxPoint: Point = data.max {p1, p2 in p1.rate < p2.rate}!
        
        let curGradient = LinearGradient(
            gradient: Gradient (
                colors: [
                    Color(.blue).opacity(0.5),
                    Color(.blue).opacity(0.0)
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        
        VStack {
            Text(defaultCurrency + " / " + symbol)
                .fontWeight(.bold)
                .padding(.vertical, 20)
            
            Chart(data) {
                LineMark(
                    x: .value("Date", $0.date),
                    y: .value("Rate", ($0.rate - minPoint.rate) * 20)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(.blue)
                
                AreaMark(
                    x: .value("Date", $0.date),
                    y: .value("Rate", ($0.rate - minPoint.rate) * 20)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(curGradient)
            }
            .padding(.horizontal, 20.0)
            .scaledToFit()
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            
            Text("Min rate: " + String(minPoint.rate))
                .fontWeight(.bold)
                .padding(.vertical, 20)
            
            Text("Max rate: " + String(maxPoint.rate))
                .fontWeight(.bold)
                .padding(.vertical, 20)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static let symbol = "CNY"
    static var previews: some View {
        HistoryView(symbol: symbol)
    }
}
