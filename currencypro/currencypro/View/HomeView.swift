//
//  ContentView.swift
//  currencypro
//
//  Authors: Chloe Ma, Mingjun Ma
//

import SwiftUI

struct HomeView: View {
    
    @State
    var currencies : [String] = selectedCurrencies
    
    func removeFromHome(_ currency: String) {
        if let index = selectedCurrencies.firstIndex(of: currency) {
            selectedCurrencies.remove(at: index)
        }
    }
    
    var body: some View {
        VStack() {
            Text("Currency Pro")
                .fontWeight(.bold)
            
            NavigationView {
                List {
                    HStack(alignment: .center, spacing: 30) {
                        Text(String(defaultAmount))
                        Image(defaultCurrency)
                        Text(defaultCurrency)
                    }
                    
                    ForEach(currencies, id: \.self) { currency in
                        HStack {
                            Button {
                                removeFromHome(currency)
                            } label: {
                                Label("", systemImage: "minus.circle")
                            }
                            
                            NavigationLink(destination: HistoryView(symbol: currency)) {
                                CurrencyListView(currency: currency)
                            }
                        }

                    }
                }.refreshable {
                    currencies = selectedCurrencies
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
