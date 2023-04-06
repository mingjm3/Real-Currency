//
//  HistoryService.swift
//  currencypro
//
//  Created by Mingjun Ma on 11/19/22.
//

import Foundation

extension Bundle {
    func getHistoryRates(_ startDate: String, _ endDate: String, _ base: String, _ symbols: String) -> [Point]? {
        let urlString = "https://api.exchangerate.host/timeseries?start_date=" + startDate + "&end_date=" + endDate + "&symbols=" + symbols + "&base=" + base
        let appURL = URL(string: urlString)!
        do {
            let data = try Data(contentsOf: appURL)
            let decoder = JSONDecoder()
            let response = try decoder.decode(Rates.self, from: data)
            return response.rates
        } catch let jsonError {
            print(jsonError)
        }
        return nil
    }
}

struct Rates: Codable {
    let rates: [Point]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dictionary = try container.decode([String: [String: Double]].self, forKey: .rates)
        rates = dictionary.map { Point(date: $0.key, rate: $0.value.first?.value ?? .zero) }
    }
}

struct Point: Codable, Identifiable {
    var id = UUID()
    let date: String
    let rate: Double
}
