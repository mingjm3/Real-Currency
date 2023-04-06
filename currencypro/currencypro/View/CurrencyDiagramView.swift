//
//  CurrencyDiagramView.swift
//  currencypro
//
//  Authors: Chloe Ma, Mingjun Ma
//

import SwiftUI

struct CurrencyDiagramView: View {
    
    let country : String
    
    var body: some View {
        Image(country)
          .resizable()
          .scaledToFit()
    }
}

struct CurrencyDiagramView_Previews: PreviewProvider {
    static let country = "USD"
    
    static var previews: some View {
      NavigationView {
          CurrencyDiagramView(country: country)
      }
    }
}
