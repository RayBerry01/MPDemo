//
//  CardDetail.swift
//  MPDemo
//
//  Created by Ray Berry on 24/08/2023.
//

import SwiftUI

struct CardDetail: View {
    
    @StateObject private var viewModel = CardViewModel()
    
    let product: Product
    
    var body: some View {
        Text(product.description)
        Text(product.price.currency + String(product.price.value))
    }
}

//struct CardDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        CardDetail()
//    }
//}
