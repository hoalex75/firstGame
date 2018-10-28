//
//  Colossus.swift
//  firstGame
//
//  Created by Alex on 28/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

class Colossus : Warrior {
    //Builder calling builder from Character
    override init(name: String) {
        super.init(name: name)
        weapon = Weapon(name: "Wooden stick", value: 6 , criticPower: 5)
        maxLifePoints = 140
        lifePoints = maxLifePoints
    }
}
