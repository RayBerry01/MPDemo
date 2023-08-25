//
//  SwiftUIView.swift
//  MPDemo
//
//  Created by Ray Berry on 23/08/2023.
//

import SwiftUI

struct CardView: View {
    
    let cardService: CardServiceProtocol
    @ObservedObject var viewModel: CardViewModel
 
    init(cardService: CardServiceProtocol) {
        self.cardService = cardService
        self.viewModel = CardViewModel(cardService: cardService)
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.pink.opacity(0.20)
                    .edgesIgnoringSafeArea(.all)
                if let cardInfo = viewModel.cardData {
                    
                    VStack(alignment: .center) {
                        Text("Moonpig")
                            .font(.title.weight(.bold))
                            .padding(.horizontal)
                            .padding(.top, 16)
                        
                        ScrollView {
                            LazyVGrid(columns: [
                                
                                GridItem(.adaptive(minimum: 100), spacing: 16),
                                GridItem(.adaptive(minimum: 100), spacing: 16),
                                GridItem(.adaptive(minimum: 100), spacing: 16)
                                
                            ], spacing: 16) {
                                ForEach(cardInfo.products) { product in
                                    NavigationLink(destination: CardDetail(viewModel: self.viewModel, product: product)) {
                                        
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
                                                    
                                                @unknown default:
                                                    ProgressView()
                                                }
                                            }
                                            
                                        }
                              
                                        .frame(width: 80, height: viewModel.generateRandomNumber())
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
                } else {
                    ProgressView()
                }
            }
        }
            .task {
                
                    await viewModel.retrieveCardInfo()
                
            }
        }
    
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
