//
//  main.swift
//  firstGame
//
//  Created by Alex on 16/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation
var albert = Combattant(name :"Albert", team : .teamOne)
albert.displayName()
var henry = Combattant(name :"Henry", team : .teamTwo)
henry.displayName()
var ines = Mage(name : "Inès", team : .teamOne)
ines.displayName()


albert.action(target: henry)
ines.action(target: henry)
ines.action(target: henry)
ines.action(target: henry)

var teamOne = Team(teamNumber: .teamOne, characterOne: albert, characterTwo: ines, characterThree: henry)

teamOne.characters[0].displayName()
