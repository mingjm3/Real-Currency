//
//  File.swift
//  currencypro
//
//  Created by Chloe Ma on 10/24/22.
//

import Foundation

extension Bundle {
    func getSymbols() -> Symbols? {
        let urlString = "https://api.exchangerate.host/symbols"
        let appURL = URL(string: urlString)! // convert string to URL
        do {
            let data = try Data(contentsOf: appURL)
            let decoder = JSONDecoder()
            let symbols = try decoder.decode(Symbols.self, from: data)
            return symbols
        } catch let jsonError {
            print(jsonError)
        }
        return nil
    }
    
}
