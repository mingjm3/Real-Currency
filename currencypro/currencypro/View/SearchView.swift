//
//  SearchView.swift
//  currencypro
//
//  Created by Mingjun Ma on 11/16/22.
//

import SwiftUI

struct SearchView: View {
    
    @State
    var queryString: String = ""
    let currencies = Bundle.main.getAllCurrencies().unsafelyUnwrapped.keys
    
    var filteredCurrency: [String] {
        if queryString.isEmpty {
            return selectedCurrencies
        } else {
            return currencies.filter { $0.localizedCaseInsensitiveContains(queryString) }
        }
    }
    
    func addToHome(_ currency: String) {
        selectedCurrencies.append(currency)
    }

    var body: some View {
        VStack {
            Text("Search")
                .fontWeight(.bold)
            NavigationView {
                List(filteredCurrency, id: \.self) { currency in
                    HStack {
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
                        }
                        Button {
                            addToHome(currency)
                        } label: {
                            Label("Add", systemImage: "plus.circle")
                        }
                        .padding(.leading)
                    }
                }
            }
            .searchable(text: $queryString, prompt: "Search Currency Code")
            .padding(10)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
