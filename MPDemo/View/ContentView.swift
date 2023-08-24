//
//  ContentView.swift
//  MPDemo
//
//  Created by Ray Berry on 23/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = CardViewModel()
    
    var body: some View {
        NavigationView {
         
            if let cardInfo = viewModel.cardData {
                
                List(cardInfo.products) {
                    product in
                    NavigationLink(destination: CardDetail(product: product)) {
                        VStack (alignment: .leading)
                        {
                            Text(product.title)
                            Text(product.price.currency + String(product.price.value))
                        }
                    }
                }
            }
        }
        .task({
            await viewModel.retrieveCardInfo()
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
