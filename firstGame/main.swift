//
//  main.swift
//  firstGame
//
//  Created by Alex on 16/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

var albert = Combattant(name :"Albert")
albert.displayName()
var henry = Combattant(name :"Henry")
henry.displayName()
var ines = Mage(name : "Inès")
ines.displayName()




var teamOne = Team(teamNumber: .teamOne, characterOne: albert, characterTwo: ines, characterThree: henry)


var game = Game(teamOne : teamOne, teamTwo : teamOne)

if let name = readLine() {
    
    print("Bonjour \(name)")
    
}

