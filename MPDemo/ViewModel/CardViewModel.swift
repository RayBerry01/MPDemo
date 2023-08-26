//
//  CardViewModel.swift
//  MPDemo
//
//  Created by Ray Berry on 23/08/2023.
//

import Foundation

class CardViewModel: ObservableObject {
    
    let cardService: CardServiceProtocol
    init(cardService: CardServiceProtocol) {
        self.cardService = cardService
    }
    
    @Published var cardData: Card?
    
    ///Retrieve card data from CardService
    func retrieveCardInfo() async {
        let result = await cardService.cards()
        await MainActor.run {
            self.cardData = result
        }
    }
    
    /// Random number generator from 3 values to determine the height of the grid cells
    /// - Returns: returns a value of either 100, 200 or 300
    func generateRandomNumber() -> CGFloat {
        let randomIndex = Int.random(in: 0..<3)
        let numbers = [100, 200, 250]
        let randomNumber = numbers[randomIndex]
        return CGFloat(randomNumber)
    }
    
    func generateHeightSequence(sequence: Int) -> CGFloat {
        
        let heightArray = [100,250,200,250,100,200,200,100,200]
        
        return CGFloat(heightArray[sequence])
    }
    
}



//LazyVGrid(columns: [
//    GridItem(.adaptive(minimum: 100), spacing: 16),
//    GridItem(.adaptive(minimum: 100), spacing: 16),
//    GridItem(.adaptive(minimum: 100), spacing: 16)
//], spacing: 16) {
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
//                     
//                    case .failure:
//                        ProgressView()
//                        
//                    @unknown default:
//                        ProgressView()
//                    }
//                }
//            }
//            .padding()
//            .background(Color.white)
//            .cornerRadius(10)
//            .shadow(radius: 3)
//        }
//    }
//    .padding()
