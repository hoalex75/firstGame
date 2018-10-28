//
//  Dwarf.swift
//  firstGame
//
//  Created by Alex on 28/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

class Dwarf : Warrior {
    //Builder calling builder from Character
    override init(name: String) {
        super.init(name: name)
        weapon = Weapon(name: "Sharped Axe", value: 14)
        maxLifePoints = 60
        lifePoints = maxLifePoints
    }
}


