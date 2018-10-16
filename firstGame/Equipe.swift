//
//  Equipe.swift
//  firstGame
//
//  Created by Alex on 17/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

enum PlayerTeam{
    case teamOne
    case teamTwo
}

struct Team{
    var teamNumber : PlayerTeam
    var characters = [Personnage]()
    
    init(teamNumber : PlayerTeam, characterOne : Personnage, characterTwo : Personnage, characterThree : Personnage){
        self.teamNumber = teamNumber
        characters = [characterOne,characterTwo,characterThree]
    }
}
