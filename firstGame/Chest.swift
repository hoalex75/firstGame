//
//  Chest.swift
//  firstGame
//
//  Created by Alex on 27/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

class Chest{
    // percent of chest's apparition
    static var percentChest = 30
    var weapons : [Weapon]
    var chestType : ChestType
    
    
    init(chestType : ChestType){
        weapons = [Weapon]()
        self.chestType = chestType
        chestType == .attackChest ? self.fillAttackChest() : self.fillHealChest()
    }
    
    private static func randomPercent() -> Double {
        return Double(arc4random() % 1000) / 10.0;
    }
    
    // return a bool which contains true if the chest appearead
    func isAppeared() -> Bool{
        let isAppeared = Chest.randomPercent() <= 30 ? true : false
        if isAppeared{
            print("\n >> A chest appeared in front of you !<<")
        }
        return isAppeared
    }
    
    // function which add a new weapon to the Array of weapon, weapons
    func addWeapon(weaponName : String, weaponValue : Int){
        let weapon = Weapon(name: weaponName, value : weaponValue)
        weapons.append(weapon)
    }
    
    // generate a given chest for warriors characters
    private func fillAttackChest(){
        self.addWeapon(weaponName: "Fire Axe", weaponValue: 40)
        self.addWeapon(weaponName: "Prismatic Bow", weaponValue: 20)
        self.addWeapon(weaponName: "Gold Daggers", weaponValue: 34)
        self.addWeapon(weaponName: "Cobalt Spear", weaponValue: 27)
    }
    
    // generate a given chest fo healers characters
    private func fillHealChest(){
        self.addWeapon(weaponName: "Lunatic Prism", weaponValue: 10)
        self.addWeapon(weaponName: "Huge Wound", weaponValue: 15)
        self.addWeapon(weaponName: "Legendary Orb of Healing", weaponValue: 25)
        self.addWeapon(weaponName: "Blood Cup", weaponValue: 20)
    }
    
    // display the content of a chest
    func displayContent(){
        print("This is the content of your chest !")
        for weapon in weapons{
            print("> \(weapon.name) : \(weapon.value) \(chestType == .attackChest ? "DMG" : "Healing") <")
        }
    }
    
    // return a random weapon in the array weapons
    func weaponSelected() -> Weapon{
        let numberOfWeapon = Int(arc4random() % 4 )
        return weapons[numberOfWeapon]
    }
}
