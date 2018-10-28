//
//  Warrior.swift
//  firstGame
//
//  Created by Alex on 28/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

//class Warrior inherited from Character, an abstract class from warriors' subclasses
class Warrior : Character{
    //Methods
    //function for attacks
    override func action(target : Character) {
        var lifePointsRemaining = target.lifePoints - weapon.value
        if lifePointsRemaining < 0 {
            lifePointsRemaining = 0
        }
        target.lifePoints = lifePointsRemaining
        target.setIsDead()
        if !target.isDead {
            print("\(self.name) attacks \(target.name) and deals \(weapon.value) DMG.")
            print("\(target.name) has \(target.lifePoints) HP left.")
        }
    }
}
