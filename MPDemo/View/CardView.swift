//
//  SwiftUIView.swift
//  MPDemo
//
//  Created by Ray Berry on 23/08/2023.
//

import SwiftUI

struct CardView: View {
    
    @StateObject private var viewModel = CardViewModel()
    
    var body: some View {
        NavigationView {
         
            if let cardInfo = viewModel.cardData {
                
                VStack(alignment: .center) {
                    Text("MoonPig")
                        .font(.title)
                        .padding(.horizontal)
                        .padding(.top, 16)
                        
                ScrollView {
                        LazyVGrid(columns: [
                            
                            GridItem(.adaptive(minimum: 100), spacing: 16),
                            GridItem(.adaptive(minimum: 100), spacing: 16),
                            GridItem(.adaptive(minimum: 100), spacing: 16)
                            
                        ], spacing: 16) {
                            ForEach(cardInfo.products) { product in
                                NavigationLink(destination: CardDetail(product: product)) {
                                    VStack(alignment: .leading) {
                                        
                                        AsyncImage(url: URL(string: product.productImage.link.href ))
                                        { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success (let image):
                                                image
                                                    .resizable()
                                                    .frame(width: 80, height: 100)
                                            case .failure:
                                                ProgressView()
//                                                Image(systemName: "exclamationmark.triangle")
                                            @unknown default:
                                                ProgressView()
//                                                Image(systemName: "exclamationmark.triangle")
                                            }
                                        }
                                        
                                        
                                      
                                       
                                        Text(product.price.currency + String(product.price.value))
                                        //  Text(product.title)
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 3)
                                }
                            }
                        }
                        .padding()
                    }
                
                }
            }
        }
        .task {
            await viewModel.retrieveCardInfo()
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
