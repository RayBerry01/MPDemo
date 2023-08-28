//
//  CardDetail.swift
//  MPDemo
//
//  Created by Ray Berry on 24/08/2023.
//

import SwiftUI

struct CardDetail: View {
    
    @ObservedObject var viewModel: CardViewModel
    
    let product: Product
    
    //MARK: MainView
    var body: some View {
        VStack {
            itemView()
            textView()
        }
        .padding()
    }
    
    //MARK: SubViews
    private func textView() ->  some View {
        return VStack {
            Spacer()
            Text(product.description.stripOutHtml() ?? "")
            Spacer()
            Text(product.price.currency + String(format: "%.2f",product.price.value))
                .foregroundColor(.pink)
                .font(.largeTitle.weight(.bold))
        }
    }
    
    private func itemView() -> some View {
        return VStack {
            //URL Caching done via AppDelegate
            AsyncImage(url: URL(string: product.productImage.link.href ))
            { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success (let image):
                    image
                        .resizable()
                        .aspectRatio(0.8, contentMode: .fit)
                case .failure:
                    ProgressView()
                @unknown default:
                    ProgressView()
                }
            }
            .cornerRadius(10)
        }
        .border(CustomColor.backgroundColor, width: 4)
        .shadow(radius: 3)
    }
}

struct CardDetail_Previews: PreviewProvider {
    /// Preview just shows a dummy image from MockCardService
    static var previews: some View {
        let cardService = MockCardService()
        let viewModel = CardViewModel(cardService: cardService)
        
        if let sampleCard = cardService.fetchSampleCard() {
            CardDetail(viewModel: viewModel, product: sampleCard)
        } else {
            Text("No product available for preview")
        }
    }
}
