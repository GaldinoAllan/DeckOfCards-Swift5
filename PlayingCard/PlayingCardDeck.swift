//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by allan galdino on 25/08/21.
//

import Foundation

struct PlayingCardDeck {
    private(set) var cards = [PlayingCard]()

    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }

    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

extension Float {
    var arc4random: Float {
        if self > 0 {
            return Float(Int(arc4random_uniform(UInt32(self))))
        } else if self < 0 {
            return Float(Int(arc4random_uniform(UInt32(abs(self)))))
        } else {
            return 0
        }
    }
}
