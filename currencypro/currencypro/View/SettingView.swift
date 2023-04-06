//
//  SettingView.swift
//  currencypro
//
//  Created by Mingjun Ma on 10/27/22.
//

import SwiftUI

struct SettingView: View {
    @State private var defaultLanguage: String = "English"
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Setting")
                .fontWeight(.bold)
            
            Form {
                HStack {
                    Text("Default Currency")
                    Spacer()
                    
                };
                
                HStack {
                    Text("Default Amount")
                    Spacer()
                };
                
                HStack {
                    Text("Language")
                    Spacer()
                    Picker("", selection: $defaultLanguage) {
                        Text("English").tag("English")
                        Text("España").tag("Spanish")
                        Text("中文").tag("Chinese")
                        Text("Français").tag("Franch")
                        Text("にほんご").tag("Japan")
                        Text("한국어").tag("Korean")
                    }
                };
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
