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
        let numbers = [100, 200, 300]
        let randomNumber = numbers[randomIndex]
        return CGFloat(randomNumber)
    }
}

