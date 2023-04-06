//
//  CountryService.swift
//  currencypro
//
//  Created by Mingjun Ma on 11/15/22.
//

import Foundation

extension Bundle {
    func getAllCurrencies() -> [String: Currency]? {
        let urlString = "https://api.exchangerate.host/symbols"
        let appURL = URL(string: urlString)! // convert string to URL
        do {
            let data = try Data(contentsOf: appURL)
            let decoder = JSONDecoder()
            let response = try decoder.decode(Symbols.self, from: data)
            return response.symbols
        } catch let jsonError {
            print(jsonError)
        }
        return nil
    }
    
    struct Symbols: Codable, Hashable {
        let symbols: [String: Currency];
    }
}
