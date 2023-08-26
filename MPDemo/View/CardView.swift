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
    
    fileprivate func textView() -> some View {
        return Text("Moonpig")
            .font(.title.weight(.bold))
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
    
    var body: some View {
        NavigationView {
            
            ZStack {
                CustomColor.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                if let cardInfo = viewModel.cardData {
                    
                    VStack(alignment: .center) {
                        textView()
                        
                        ScrollView {
                            LazyVGrid(columns: [
                                
                                GridItem(.adaptive(minimum: 100), spacing: 16),
                                GridItem(.adaptive(minimum: 100), spacing: 16),
                                GridItem(.adaptive(minimum: 100), spacing: 16)
                                
                            ], spacing: 16) {
                                //ForEach(cardInfo.products) { product in
                                
                                    ForEach(Array(cardInfo.products.enumerated()), id: \.element.id) { index, product in
                                      
                                
                                    NavigationLink(destination: CardDetail(viewModel: self.viewModel, product: product)) {
                                        let wrappedIndex = index % 9
                                        imageView(product:product)
                                        
                                        .frame(width: 80, height: viewModel.generateHeightSequence(sequence: wrappedIndex))
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


//    ForEach(Array(cardInfo.products.enumerated()), id: \.element.id) { index, product in
//        NavigationLink(destination: CardDetail(viewModel: self.viewModel, product: product)) {
//            VStack(alignment: .leading) {
//                AsyncImage(url: URL(string: product.productImage.link.href )) { phase in
//                    switch phase {
//                    case .empty:
//                        ProgressView()
//                    case .success (let image):
//                        let wrappedIndex = index % 8
//                        image
//                            .resizable()
//                            .frame(width: 80, height: viewModel.generateHeightSequence(sequence: wrappedIndex))


//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
