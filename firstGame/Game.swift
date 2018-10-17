//
//  Game.swift
//  firstGame
//
//  Created by Alex on 17/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

struct Game{
    let team1,team2 : Team
    
    init(teamOne : Team, teamTwo: Team){
        Game.introDisplay(1)
        //readLine
        team1 = teamOne
        team2 = teamTwo
    }
    
    private static func introDisplay(_ number : Int){
        print("Player \(number == 1 ? "one" : "two") you must choose three characters to complete your team.")
        print("You can have several times the same type of warrior, here are the choices :")
        print("Combattant : L'attaquant classique. Un bon guerrier !")
        print("Mage : Son talent ? Soigner les membres de son équipe.")
        print("Colosse : Imposant et très résistant, mais il ne vous fera pas bien mal")
        print("Nain : Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.")
    }
    
    private static func teamRecrutment(_ number : Int){
        for _ in 1...3{
            
            
        }
        
    }
    
    private static func choiceEntry(_ number : Int) -> String{
        print("Player \(number == 1 ? "one" : "two") which type of warrior will join your team ?")
        if let choice = readLine(){
            switch choice {
            case "1","2","3","4" :
                return choice
            default :
                print("Your choice is not available, choose a number between 1 and 4.")
                let err = choiceEntry(number)
                return err
            }
        }
        let err = choiceEntry(number)
        return err
    }
}
