//
//  CurrencyListView.swift
//  currencypro
//
//  Authors: Chloe Ma
//

import SwiftUI

struct CurrencyListView: View {
   
    let currency: String
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 16) {
            Text(currency)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)

            Image(currency)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )

            let convertInfo = Bundle.main.getConvertResult(defaultCurrency, currency, defaultAmount).unsafelyUnwrapped
            let calulated : Double = convertInfo
            Text(String(format: "%.001f", calulated))
        }
    }
  }

  struct CurrencyListView_Previews: PreviewProvider {
    static let country = "USD"

    static var previews: some View {
        CurrencyListView(currency: country)
        .previewLayout(.sizeThatFits)
        .padding()
    }
  }
