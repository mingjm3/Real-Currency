//
//  MainView.swift
//  currencypro
//
//  Authors: Chloe Ma, Mingjun Ma
//

import SwiftUI

struct MainView: View {
    let countries = ["USD", "GBP"]
    var body: some View {
      TabView {
        HomeView()
            .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("Home")
            }
        
        SearchView()
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
          
        ConverterView()
            .tabItem {
                Image(systemName: "rectangle.2.swap")
                Text("Converter")
            }
        
//        SettingView()
//            .tabItem {
//                Image(systemName: "gear")
//                Text("Setting")
//            }
      }
    }
  }

  struct MainView_Previews: PreviewProvider {
    static var previews: some View {
      MainView()
    }
  }
