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
    
    //Function which is here to prevent healing over the maximum of life points
    private func isFullyRestore(target : Character, crit : Bool) -> Bool{
        if target.lifePoints + weapon.value * (crit ? 2 : 1) >= target.maxLifePoints{
            return true
        }else {
            return false
        }
    }
    
    //Function of healing
    override func action(target : Character){
        let crit = self.isACrit()
        if isFullyRestore(target: target, crit: crit){
            print("\(self.name) heals \(target.name) for \(target.maxLifePoints - target.lifePoints) HP.")
            target.lifePoints = target.maxLifePoints
            
        }
        else {
            target.lifePoints = target.lifePoints + weapon.value * (crit ? 2 : 1)
            print("\(self.name) heals \(target.name) for \(weapon.value * (crit ? 2 : 1)) HP.")
        }
        
        print("\(target.name) has \(target.lifePoints) HP left.")
    }
}
