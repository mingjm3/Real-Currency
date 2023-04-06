//
//  ConvertService.swift
//  currencypro
//
//  Created by Mingjun Ma on 11/15/22.
//

import Foundation

extension Bundle {
    func getConvertResult(_ fromCountry: String, _ toCountry: String, _ amount: Double) -> Double? {
        let url = "https://api.exchangerate.host/convert?from=" + fromCountry + "&to=" + toCountry + "&amount=" + String(amount)
        do {
            let data = try Data(contentsOf: URL(string: url)!)
            let decoder = JSONDecoder()
            let convertResult = try decoder.decode(ConvertResult.self, from: data)
            return convertResult.result
        } catch let jsonError {
            print(jsonError)
        }
        return nil
    }
}

struct ConvertResult: Codable, Hashable {
    let result: Double
    let date: String
}
