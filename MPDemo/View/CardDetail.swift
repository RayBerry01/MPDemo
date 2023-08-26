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
    
    //MARK: MainView
    
    var body: some View {
        VStack {
            itemView()
            textView()
        }.padding()
    }
    
    //MARK: SubViews
    fileprivate func textView() -> VStack<TupleView<(Spacer, Text, Spacer, Text)>> {
        return VStack {
            Spacer()
            Text(product.description.stripOutHtml() ?? "")
            Spacer()
            Text(product.price.currency + String(product.price.value))
                .foregroundColor(.pink)
                .font(.largeTitle.weight(.bold))
        }
    }
    
    fileprivate func itemView() -> some View {
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
                        .frame(width: 200, height: 300)
                case .failure:
                    ProgressView()
                @unknown default:
                    ProgressView()
                }
            }
        }.border(CustomColor.backgroundColor, width: 4)
    }
}

//struct CardDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        CardDetail()
//    }
//}
