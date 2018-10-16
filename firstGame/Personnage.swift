//
//  Personnage.swift
//  firstGame
//
//  Created by Alex on 16/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

class Personnage{
    static var names = Set<String>()
    var name = ""
    var maxLifePoints = 0
    var lifePoints = 0
    let team : PlayerTeam
    
    //Builder
    init(name : String, team : PlayerTeam){
        if Personnage.existingName(nameWeWant: name){
            self.team = team
        } else {
            Personnage.names.insert(name)
            self.name = name
            self.team = team
        }
    }
    //Methods
    static func existingName(nameWeWant : String) -> Bool {
        return names.contains(nameWeWant)
    }
    
    func displayName(){
        print("My name is \(name)")
    }
    
    func action(target : Personnage){}
}
//class Warrior inherited from Personnage, an abstract class from warriors' subclasses
class Warrior : Personnage{
    var attackValue = 0
    
    //Methods
    func attackTarget(target : Personnage){
        target.lifePoints = target.lifePoints - attackValue
        print("Life points remaining on \(target.name) are of \(target.lifePoints) ")
    }
    override func action(target : Personnage) {
        target.lifePoints = target.lifePoints - attackValue
        print("Life points remaining on \(target.name) are of \(target.lifePoints) ")
    }
}

//class Healer inherited from Personnage, an abstract class from healers' subclasses
class Healer : Personnage{
    var healValue = 0
    
    //Methods
    private func isOnTheSameTeam(target : Personnage) -> Bool{
        if target.team != self.team {
            return false
        }else {
            return true
        }
    }
    
    private func isFullyRestore(target : Personnage) -> Bool{
        if target.lifePoints + healValue >= target.maxLifePoints{
            return true
        }else {
            return false
        }
    }
    
    override func action(target : Personnage){
        if isOnTheSameTeam(target: target){
            if isFullyRestore(target: target){
                target.lifePoints = target.maxLifePoints
            }
            else {
                target.lifePoints = target.lifePoints + healValue
            }
            print("Life points remaining on \(target.name) are of \(target.lifePoints) ")
        } else {
            print("You are healing an enemy")
        }
    }
}

//Real classes
class Mage : Healer {
    
    //Builder calling builder from Personnage
    override init(name: String, team : PlayerTeam) {
        super.init(name: name, team : team)
        healValue = 5
        maxLifePoints = 80
        lifePoints = maxLifePoints
    }
}

class Combattant : Warrior {
    //Builder calling builder from Personnage
    override init(name: String, team : PlayerTeam) {
        super.init(name: name, team : team)
        attackValue = 10
        maxLifePoints = 100
        lifePoints = maxLifePoints
    }
}

class Colosse : Warrior {
    //Builder calling builder from Personnage
    override init(name: String, team : PlayerTeam) {
        super.init(name: name, team : team)
        attackValue = 6
        maxLifePoints = 140
        lifePoints = maxLifePoints
    }
}

class Nain : Warrior {
    //Builder calling builder from Personnage
    override init(name: String, team : PlayerTeam) {
        super.init(name: name, team : team)
        attackValue = 14
        maxLifePoints = 60
        lifePoints = maxLifePoints
    }
}
