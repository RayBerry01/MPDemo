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
    
    //MARK: MainView
    
    var body: some View {
        NavigationView {
            
            ZStack {
                CustomColor.backgroundColor
                .edgesIgnoringSafeArea(.all)
                
                if let cardInfo = viewModel.cardData {
                    
                    VStack(alignment: .center) {
                        titleView()
                        
                        ScrollView {
                            LazyVGrid(columns: [
                                
                                GridItem(.adaptive(minimum: 100), spacing: 16),
                                GridItem(.adaptive(minimum: 100), spacing: 16),
                                GridItem(.adaptive(minimum: 100), spacing: 16)
                                
                            ], spacing: 16) {
                                navigationView(cardInfo: cardInfo)
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
   
    //MARK: SubViews
    
    fileprivate func titleView() -> some View {
        return Text("Moonpig")
            .font(.title.weight(.bold))
            .padding(.horizontal)
            .padding(.top, 16)
    }
    
    fileprivate func imageView(product: Product) -> VStack<AsyncImage<_ConditionalContent<_ConditionalContent<ProgressView<EmptyView, EmptyView>, some View>, _ConditionalContent<ProgressView<EmptyView, EmptyView>, ProgressView<EmptyView, EmptyView>>>>> {
        return VStack(alignment: .leading) {
            
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
    }
  
    fileprivate func navigationView(cardInfo: Card) -> ForEach<[Product], UUID, NavigationLink<some View, CardDetail>> {
        return ForEach(cardInfo.products) { product in
            NavigationLink(destination: CardDetail(viewModel: self.viewModel, product: product)) {
                
                imageView(product: product)
                
                    .frame(width: 80, height: viewModel.generateRandomNumber())
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
            }
        }
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
