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
    var team = PlayerTeam.noTeam
    var isDead = false
    
    //Builder
    init(name : String){
        Personnage.names.insert(name)
        self.name = name
    }
    //Methods
    static func existingName(nameWeWant : String) -> Bool {
        let existingName = Personnage.names.contains(nameWeWant)
        return existingName
    }
    
    func displayName(){
        print("My name is \(name)")
    }
    
    func action(target : Personnage){}
    
    // soucis si j'initialise avant le switch il me renvoie les deux "personnages"
    // Function which creates the characters with a name given by the player.
    static func createCharacter(choice : String) -> Personnage{
        switch choice {
        case "1" :
            let character = Combattant(name: Personnage.nameEntry(warriorType: "Combattant"))
            return character
        case "2" :
            let character = Nain(name : Personnage.nameEntry(warriorType: "Nain"))
            return character
        case "3" :
            let character = Colosse(name : Personnage.nameEntry(warriorType: "Colosse"))
            return character
        case "4" :
            let character = Mage(name : Personnage.nameEntry(warriorType: "Mage"))
            return character
        default :
            print("impossible de se retrouver ici, createCharacter")
        }
        let character = Colosse(name : "default")
        return character
    }
    
    //Function which save the name entries by the player and return it.
    static func nameEntry(warriorType : String) -> String{
        print("\nWhich name do you want for your \(warriorType) ?")
        if let name = readLine(){
            if Personnage.existingName(nameWeWant: name){
                print("Name already taken for one character, please pick a new one.")
                let newName = Personnage.nameEntry(warriorType: warriorType)
                return newName
            } else {
                return name
            }
        }
        print("You don't choose a name or a problem occured, pls try again")
        let err = Personnage.nameEntry(warriorType: warriorType)
        return err
    }
    
    //Function which change the boolean isDead if the character has no lp left
    func setIsDead(){
        isDead = lifePoints <= 0
        if isDead {
            print("\(name) has just died !")
        }
    }
    
    
}
//class Warrior inherited from Personnage, an abstract class from warriors' subclasses
class Warrior : Personnage{
    var attackValue = 0
    
    //Methods
    //function for attacks
    override func action(target : Personnage) {
        target.lifePoints = target.lifePoints - attackValue
        target.setIsDead()
        if !target.isDead {
            print("\(self.name) attacks \(target.name) and deals \(attackValue) DMG.")
            print("\(target.name) has \(target.lifePoints) HP left.")
        }
    }
}

//class Healer inherited from Personnage, an abstract class from healers' subclasses
class Healer : Personnage{
    var healValue = 0
    
    //Methods
    //Function which tests if the target is on the same team as the healer
    private func isOnTheSameTeam(target : Personnage) -> Bool{
        if target.team != self.team {
            return false
        }else {
            return true
        }
    }
    
    //Function which is here to prevent healing over the maximum of life points
    private func isFullyRestore(target : Personnage) -> Bool{
        if target.lifePoints + healValue >= target.maxLifePoints{
            return true
        }else {
            return false
        }
    }
    
    //Function of healing
    override func action(target : Personnage){
        if isOnTheSameTeam(target: target){
            if isFullyRestore(target: target){
                target.lifePoints = target.maxLifePoints
            }
            else {
                target.lifePoints = target.lifePoints + healValue
            }
            print("\(self.name) heals \(target.name) for \(healValue) HP.")
            print("\(target.name) has \(target.lifePoints) HP left.")
        } else {
            print("You are healing an enemy")
        }
    }
}

//Real classes
class Mage : Healer {
    
    //Builder calling builder from Personnage
    override init(name: String) {
        super.init(name: name)
        healValue = 5
        maxLifePoints = 80
        lifePoints = maxLifePoints
    }
}

class Combattant : Warrior {
    //Builder calling builder from Personnage
    override init(name: String) {
        super.init(name: name)
        attackValue = 10
        maxLifePoints = 100
        lifePoints = maxLifePoints
    }
}

class Colosse : Warrior {
    //Builder calling builder from Personnage
    override init(name: String) {
        super.init(name: name)
        attackValue = 6
        maxLifePoints = 140
        lifePoints = maxLifePoints
    }
}

class Nain : Warrior {
    //Builder calling builder from Personnage
    override init(name: String) {
        super.init(name: name)
        attackValue = 14
        maxLifePoints = 60
        lifePoints = maxLifePoints
    }
}
