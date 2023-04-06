//
//  ConverterView.swift
//  currencypro
//
//  Created by Mingjun Ma on 10/28/22.
//

import SwiftUI

struct ConverterView: View {
    
    @State private var sourceCurrency: String = "USD"
    @State private var targetCurrency: String = "GBP"
    @State private var amount: String = ""
    @State private var result: String = "0"
    
    let currencies = Array(Bundle.main.getAllCurrencies().unsafelyUnwrapped.keys).sorted()
    
    func switchCountries() {
        let tempID = sourceCurrency
        sourceCurrency = targetCurrency
        targetCurrency = tempID
    }
    
    var body: some View {
        VStack {
            Text("Converter")
                .fontWeight(.bold)
            Form {
                HStack{
                    Picker(selection: $sourceCurrency, label: Image(sourceCurrency)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        ) {
                        ForEach(currencies, id: \.self) {
                            Text($0)
                        }.tag(currencies)
                    }
                    TextField(
                        "Amount",
                        text: $amount,
                        onEditingChanged: { (isBegin) in
                            if isBegin {
                                result = "0"
                            } else {
                                result = "\(Bundle.main.getConvertResult(sourceCurrency, targetCurrency, Double(amount)!).unsafelyUnwrapped)"
                            }
                        }
                    )
                    .frame(width: 150.0, height: 50.0)
                    .multilineTextAlignment(.center)
                    
                }
                .keyboardType(/*@START_MENU_TOKEN@*/.numbersAndPunctuation/*@END_MENU_TOKEN@*/)
                
                Button {
                    switchCountries()
                } label: {
                    HStack{
                        Image(systemName: "chevron.up.chevron.down")
                            .padding(.vertical)
                            .frame(width: 50.0, height: 50.0)
                        Text("Switch")
                    }
                }
                .padding(.vertical)
                
                HStack{
                    Picker(selection: $targetCurrency, label: Image(targetCurrency)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    ) {
                        ForEach(currencies, id: \.self) {
                            Text($0)
                        }.tag(currencies)
                    }
                    Text(result)
                        .multilineTextAlignment(.center)
                        .frame(width: 150.0, height: 50.0)
                }
            }
        }
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
    }
}
