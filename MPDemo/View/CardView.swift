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
  
    let smallCard  = UIScreen.screenHeight/5
    let mediumCard = UIScreen.screenHeight/4
    let largeCard = UIScreen.screenHeight/3
    
    init(cardService: CardServiceProtocol) {
        self.cardService = cardService
        self.viewModel = CardViewModel(cardService: cardService)
    }
    
    //MARK: Main View
    var body: some View {
        NavigationView {
            
            ZStack {
                CustomColor.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                if let cardInfo = viewModel.cardData {
                    VStack(alignment: .center) {
                        textView()
                        cardGridView(cardInfo: cardInfo)
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
    func textView() -> some View {
        return Text("Moonpig")
            .font(.title.weight(.bold))
            .padding(.top, 16)
    }
    
    func imageView(product: Product) -> some View{
        return VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: product.productImage.link.href ))
            { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success (let image):
                    image
                        .resizable()
                        .aspectRatio(0.6, contentMode: .fit)
                    
                case .failure:
                    ProgressView()
                    
                @unknown default:
                    ProgressView()
                }
            }
        }
    }
    
    func cardGridView(cardInfo: Card) -> some View {
        return ScrollView {
            
            let heightSequence = [smallCard,largeCard,mediumCard,largeCard,smallCard,mediumCard,mediumCard,smallCard,largeCard]
            
            LazyVGrid(columns: [
                
                GridItem(.adaptive(minimum: 100), spacing: 16),
                GridItem(.adaptive(minimum: 100), spacing: 16),
                GridItem(.adaptive(minimum: 100), spacing: 16)
                
            ], spacing: 16) {
                ForEach(Array(cardInfo.products.enumerated()), id: \.element.id) { index, product in
                    
                    NavigationLink(destination: CardDetail(viewModel: self.viewModel, product: product)) {
                        let wrappedIndex = index % heightSequence.count
                        imageView(product:product)
                            .frame(width: 80, height: heightSequence[wrappedIndex])
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

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}



