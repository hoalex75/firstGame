//
//  Mage.swift
//  firstGame
//
//  Created by Alex on 28/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

class Mage : Healer {
    
    //Builder calling builder from Character
    override init(name: String) {
        super.init(name: name)
        weapon = Weapon(name: "Wound", value: 7, criticPower: 25)
        maxLifePoints = 80
        lifePoints = maxLifePoints
    }
}
