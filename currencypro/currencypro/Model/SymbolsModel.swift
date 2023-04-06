//
//  SymbolsModel.swift
//  currencypro
//
//  Created by Chloe Ma on 11/10/22.
//

import SwiftUI

struct Symbols: Codable, Hashable {
    let success: Bool
    let symbols: [String : SymbolsDetails]
}

struct SymbolsDetails: Codable, Hashable {
    let description: String
    let code: String
}
