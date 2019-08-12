//
//  CardController.swift
//  DeckOfCards
//
//  Created by Mitch Merrell on 8/12/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//
import UIKit
import Foundation

class CardController {
    
    //Mark: Shared Instance
    
    static let shared = CardController()
    
    let baseUrl = URL(string: "https://deckofcardsapi.com/api/deck/9scdojav09oj/draw/")!
    
    // @escaping escape out of the scope of this function
    func fetchCard(completion: @escaping (Card?) -> Void) {
        
        var urlRequest = URLRequest(url: baseUrl)
        urlRequest.httpMethod = "GET"
        // ?count=1
        urlRequest.addValue("1", forHTTPHeaderField: "count")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let error = error {
                print("Error fetching card: \(error): \(error.localizedDescription)")
                completion(nil); return
            }
            
            guard let data = data else { return }
            
            do {
                //
                let card = try JSONDecoder().decode(JsonDictionary.self, from: data).cards.first
                completion(card)
                
            } catch let error {
                print("Error \(error): \(error.localizedDescription)")
            }
            
            
        }.resume()
        
    }
    
    func fetchCardImage(imageStr: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: imageStr) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print("Error getting image \(error)")
                completion(nil); return
            }
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
            
        }.resume()
    }
}
