//
//  CardDetail.swift
//  MPDemo
//
//  Created by Ray Berry on 24/08/2023.
//

import SwiftUI

struct CardDetail: View {
    
    @StateObject var viewModel: CardViewModel
    
    let product: Product
    
    var body: some View {
        VStack {
            //URL Caching done via AppDelegate
            AsyncImage(url: URL(string: product.productImage.link.href ))
            { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success (let image):
                    image
                        .resizable()
                        .frame(width: 200, height: 300)                                             
                case .failure:
                    ProgressView()
                @unknown default:
                    ProgressView()
                }
            }
            Spacer()
            Text(product.description.stripOutHtml() ?? "")
            Spacer()
            Text(product.price.currency + String(product.price.value))
                .foregroundColor(.pink)
                .font(.largeTitle.weight(.bold))
        }.padding()
    }
}

//struct CardDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        CardDetail()
//    }
//}
