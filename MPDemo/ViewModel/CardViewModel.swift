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
}
