//
//  CardViewModel.swift
//  MPDemo
//
//  Created by Ray Berry on 23/08/2023.
//

import Foundation

class CardViewModel: ObservableObject {
    
    @Published var cardData: Card?
    
    func retrieveCardInfo() async {
        
        // TO DO - prompt something went wrong to user
        guard let url = URL(string: "https://moonpig.github.io/tech-test-frontend/search.json") else {return}
        
        do {
            guard let cardInfo = try await fetchData(url: url) else {return}
            print(cardInfo.products[0].description)
            DispatchQueue.main.async {
                self.cardData = cardInfo
            }
            
            
        } catch {
            print("unable to retrieve data")
            
        }
    }
    
    private func fetchData(url: URL) async throws -> Card? {
        
        let(data, response) = try await
        
        URLSession.shared.data(from:url)
        
        do {
            
            let cardResponse = try JSONDecoder().decode(Card.self, from: data)
            
            print(response.description)
            print(String(data: data, encoding: .utf8) ?? "unable to process data")
            return cardResponse
            
        } catch {
            print("JSON decoding error")
            return nil
        }
        
    }
    
}
