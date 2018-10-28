//
//  Healer.swift
//  firstGame
//
//  Created by Alex on 28/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

//class Healer inherited from Character, an abstract class from healers' subclasses
class Healer : Character{
    
    //Methods
    //Function which tests if the target is on the same team as the healer
    private func isOnTheSameTeam(target : Character) -> Bool{
        if target.team != self.team {
            return false
        }else {
            return true
        }
    }
    
    //Function which is here to prevent healing over the maximum of life points
    private func isFullyRestore(target : Character) -> Bool{
        if target.lifePoints + weapon.value >= target.maxLifePoints{
            return true
        }else {
            return false
        }
    }
    
    //Function of healing
    override func action(target : Character){
        if isOnTheSameTeam(target: target){
            if isFullyRestore(target: target){
                target.lifePoints = target.maxLifePoints
            }
            else {
                target.lifePoints = target.lifePoints + weapon.value
            }
            print("\(self.name) heals \(target.name) for \(weapon.value) HP.")
            print("\(target.name) has \(target.lifePoints) HP left.")
        } else {
            print("You are healing an enemy")
        }
    }
}
