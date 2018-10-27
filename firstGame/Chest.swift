//
//  Chest.swift
//  firstGame
//
//  Created by Alex on 27/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

enum ChestType{
    case healChest
    case attackChest
}

class Chest{
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
    
    func isAppeared() -> Bool{
        let isAppeared = Chest.randomPercent() <= 30 ? true : false
        if isAppeared{
            print("\n >> A chest appeared in front of you !<<")
        }
        return isAppeared
    }
    
    func addWeapon(weaponName : String, weaponValue : Int){
        let weapon = Weapon(name: weaponName, value : weaponValue)
        weapons.append(weapon)
    }
    
    
    private func fillAttackChest(){
        self.addWeapon(weaponName: "Fire Axe", weaponValue: 40)
        self.addWeapon(weaponName: "Prismatic Bow", weaponValue: 20)
        self.addWeapon(weaponName: "Gold Daggers", weaponValue: 34)
        self.addWeapon(weaponName: "Cobalt Spear", weaponValue: 27)
    }
    
    private func fillHealChest(){
        self.addWeapon(weaponName: "Lunatic Prism", weaponValue: 10)
        self.addWeapon(weaponName: "Huge Wound", weaponValue: 15)
        self.addWeapon(weaponName: "Legendary Orb of Healing", weaponValue: 25)
        self.addWeapon(weaponName: "Blood Cup", weaponValue: 20)
    }
    
    func displayContent(){
        print("This is the content of your chest !")
        for weapon in weapons{
            print("> \(weapon.name) : \(weapon.value) \(chestType == .attackChest ? "DMG" : "Healing") <")
        }
    }
    
    func weaponSelected() -> Weapon{
        let numberOfWeapon = Int(arc4random() % 4 )
        return weapons[numberOfWeapon]
    }
}
