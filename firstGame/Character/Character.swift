//
//  Character.swift
//  firstGame
//
//  Created by Alex on 16/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

class Character{
    static var names = Set<String>()
    var name = ""
    var maxLifePoints = 0
    var lifePoints = 0
    var team = PlayerTeam.noTeam
    var isDead = false
    var weapon = Weapon(name : "no weapon",value : 0)
    
    //Builder
    init(name : String){
        Character.names.insert(name)
        self.name = name
    }
    //Methods
    static func existingName(nameWeWant : String) -> Bool {
        let existingName = Character.names.contains(nameWeWant)
        return existingName
    }
    
    func displayName(){
        print("My name is \(name)")
    }
    
    func action(target : Character){}
    
    // soucis si j'initialise avant le switch il me renvoie les deux "personnages"
    // Function which creates the characters with a name given by the player.
    static func createCharacter(choice : String) -> Character{
        switch choice {
        case "1" :
            let character = Swordsman(name: Character.nameEntry(warriorType: "Swordsman"))
            return character
        case "2" :
            let character = Dwarf(name : Character.nameEntry(warriorType: "Dwarf"))
            return character
        case "3" :
            let character = Colossus(name : Character.nameEntry(warriorType: "Colossus"))
            return character
        case "4" :
            let character = Mage(name : Character.nameEntry(warriorType: "Mage"))
            return character
        default :
            print("impossible de se retrouver ici, createCharacter")
        }
        let character = Colossus(name : "default")
        return character
    }
    
    //Function which save the name entries by the player and return it.
    static func nameEntry(warriorType : String) -> String{
        print("\nWhich name do you want for your \(warriorType) ?")
        if let name = readLine(){
            if Character.existingName(nameWeWant: name){
                print("Name already taken for one character, please pick a new one.")
                let newName = Character.nameEntry(warriorType: warriorType)
                return newName
            } else {
                return name
            }
        }
        print("You don't choose a name or a problem occured, pls try again")
        let err = Character.nameEntry(warriorType: warriorType)
        return err
    }
    
    //Function which change the boolean isDead if the character has no lp left
    func setIsDead(){
        isDead = lifePoints <= 0
        if isDead {
            print("\(name) has just died !")
        }
    }
    
    func equipNewWeapon( weapon : Weapon){
        print(">>\(self.name) has just equipped the \(weapon.name) \(weapon.value)", terminator : " ")
        self.weapon = weapon
    }
    
}


