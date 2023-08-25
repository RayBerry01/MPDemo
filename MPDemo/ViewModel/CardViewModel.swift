//
//  CardViewModel.swift
//  MPDemo
//
//  Created by Ray Berry on 23/08/2023.
//

import Foundation

@MainActor class CardViewModel: ObservableObject {
    
    let cardService: CardServiceProtocol
    
    init(cardService: CardServiceProtocol) {
        self.cardService = cardService
    }
    
    @Published var cardData: Card?
    
    ///Retrieve card data from CardService
    func retrieveCardInfo() async {
        self.cardData = await cardService.cards()
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

class NetworkService: CardServiceProtocol {
    
    enum CardInfoError: Error {
        case invalidURL
        case network(Error)
        case parsingError
    }
    
    func cards() async -> Card? {
        
        do {
            guard let url = URL(string: "https://moonpig.github.io/tech-test-frontend/search.json") else {throw CardInfoError.invalidURL}
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw CardInfoError.network(NSError(domain: "Response error", code: 0))
            }
            
            switch httpResponse.statusCode {
                // if status 200 - all ok
            case 200:
                let cardResponse = try decodeCard(from: data)
                //                    print(String(data: data, encoding: .utf8) ?? "Unable to process data")
                return cardResponse
                //otherwise handle errors
            default:
                throw CardInfoError.network(NSError(domain: "HTTP Error", code: httpResponse.statusCode))
            }
        }catch{
            handleError(error)
            return nil
        }
        
    }
    
    /// Error handling routine - just prints results to the console
    ///
    /// - Parameter error: error code from network fail
    private func handleError(_ error: Error) {
        switch error {
        case CardInfoError.invalidURL:
            print("Invalid URL")
        case CardInfoError.network(let innerError):
            print("Network error: \(innerError)")
        case CardInfoError.parsingError:
            print("Unable to parse data")
        default:
            print("Unable to retrieve data")
        }
    }
    
    private func decodeCard(from data: Data) throws -> Card {
        do {
            return try JSONDecoder().decode(Card.self, from: data)
        } catch {
            throw CardInfoError.parsingError
        }
    }
}
