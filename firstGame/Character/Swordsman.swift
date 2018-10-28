//
//  Swordsman.swift
//  firstGame
//
//  Created by Alex on 28/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

class Swordsman : Warrior {
    //Builder calling builder from Character
    override init(name: String) {
        super.init(name: name)
        weapon = Weapon(name: "Sword", value: 10)
        maxLifePoints = 100
        lifePoints = maxLifePoints
    }
}
