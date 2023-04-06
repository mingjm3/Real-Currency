//
//  LocalCountryView.swift
//  currencypro
//
//  Created by Chloe Ma on 10/27/22.
//

import SwiftUI

struct LocalCountryView: View {
    
    let country : String
    
    func refresh () {
        print("refresh exchange rates")
    }
    
    
    var body: some View {
        
    }
}

struct LocalCountryView_Previews: PreviewProvider {
    static let country = "USD"
    
    static var previews: some View {
        LocalCountryView(country: country)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
