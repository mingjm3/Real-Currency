//
//  CountryModel.swift
//  currencypro
//
//  Authors: Chloe Ma, Mingjun Ma
//

import SwiftUI

struct Country: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let flag: String
    let results: [String : Double]
    let updated: String
    
    func getRate (_ targetCountry: String) -> Double {
        return self.results[targetCountry] ?? 0
    }
}
