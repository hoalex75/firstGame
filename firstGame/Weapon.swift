//
//  Weapon.swift
//  firstGame
//
//  Created by Alex on 27/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

//structure for weapons
struct Weapon{
    // name of the weapon
    var name : String
    // attack power and critic chances in percent
    var value,criticPower : Int
    
    init( name : String, value : Int, criticPower : Int){
        self.name = name
        self.value = value
        self.criticPower = criticPower
    }
}

