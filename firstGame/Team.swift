//
//  Equipe.swift
//  firstGame
//
//  Created by Alex on 17/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

struct Team{
    let teamNumber : PlayerTeam
    let player : Player
    var characters = [Character]()
    
    init(player : Player, characters : [Character]){
        self.player = player
        teamNumber = player.team
        self.characters = characters
    }
    
    //Function which displays the number of the team and its characters.
    func displayTeamMembers(){
        var i = 1
        print("\(player.name)'s team ", terminator : ":")
        for character in self.characters {
            print("\(i)-\(character.name) : \(character.lifePoints)/\(character.maxLifePoints) HP\(i != 3 ? " ": "")", terminator:"")
            i += 1
        }
        print("")
    }
    
    //Function which tests if a team has its entire members dead
    func isDead(winner : Player) -> Bool {
        let isFinished = characters[0].isDead && characters[1].isDead && characters[2].isDead
        if isFinished {
            print("\(winner.name) has won this game !! Congratulations to both of you.")
        }
        return isFinished
    }
}
