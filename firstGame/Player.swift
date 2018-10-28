//
//  Player.swift
//  firstGame
//
//  Created by Alex on 22/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

struct Player{
    var team : PlayerTeam
    var score = 0
    let name : String
    
    
    init(team :PlayerTeam, name : String){
        self.team = team
        self.name = name
    }
    
    // function which asks his name to the player, recalls itself if no entry
    static func readName() -> String{
        print("Hey champion! What's your name ?")
        if let name = readLine() {
            return name
        }
        print("An error occurred, let's do this again !")
        let err = readName()
        return err
    }
}
