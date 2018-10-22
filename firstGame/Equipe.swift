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
    case noTeam
}

struct Team{
    var teamNumber : PlayerTeam
    var characters = [Personnage]()
    
    init(player : Player, characters : [Personnage]){
        teamNumber = player.team
        self.characters = characters
    }
    
    //Function which displays the number of the team and its characters.
    func displayTeamMembers(){
        var i = 1
        print("\(self.teamNumber == .teamOne ? "Team One " : "Team Two " )", terminator : ":")
        for character in self.characters {
            print("\(i)-\(character.name) \(i != 3 ? " ": "")", terminator:"")
            i += 1
        }
        print("")
    }
}
