//
//  DrawViewController.swift
//  DeckOfCards
//
//  Created by Mitch Merrell on 8/12/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        
        CardController.shared.fetchCard{ (card) in
            guard let card = card else { return }
            
            DispatchQueue.main.async {
                self.suitLabel.text = card.suit
                self.valueLabel.text = card.value
                
            }
            
            CardController.shared.fetchCardImage(imageStr: card.image, completion: { (image) in
                
                DispatchQueue.main.async {
                   self.cardImageView.image = image
                }
                
            })
            
        }
        
    }
    
}
