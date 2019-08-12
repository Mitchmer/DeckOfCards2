//
//  Card.swift
//  DeckOfCards
//
//  Created by Mitch Merrell on 8/12/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

import Foundation

struct JsonDictionary: Decodable {
    
    let cards: [Card]
}

struct Card: Decodable {
    
    let image: String
    let value: String
    let suit: String
    
//    what to do if a key is something weird, i.e. is suit was originally called suitCrazyness
//    private enum CodingKeys: String, CodingKey {
//        case image
//        case value
//        case suit = "suitCrazyness"
//    }
    
}
