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
    
    init(){
        team1 = Game.teamRecrutment(1)
        team2 = Game.teamRecrutment(2)
    }
    
    //Function with prints which display the caracteristics of all characters, teamNumber required to adjust display
    private static func introDisplay(teamNumber : Int, name : String){
        print("\(name) you must choose three characters to complete your team.")
        print("You can have several times the same type of warrior, here are the choices :")
        print("Combattant : L'attaquant classique. Un bon guerrier !")
        print("Mage : Son talent ? Soigner les membres de son équipe.")
        print("Colosse : Imposant et très résistant, mais il ne vous fera pas bien mal")
        print("Nain : Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.")
    }
    
    //Function which creates characters and put them in a new team
    private static func teamRecrutment(_ teamNumber : Int) -> Team{
        var choice = ""
        var character : Personnage
        var characters = [Personnage]()
        let name = Player.readName()
        let player = Player( team : teamNumber == 1 ? .teamOne : .teamTwo, name : name)
        Game.introDisplay(teamNumber : teamNumber, name : name)
        
        for _ in 1...3{
            choice = Game.choiceEntry(name)
            character = Personnage.createCharacter(choice : choice)
            characters.append(character)
        }
        
        let newTeam = Team(player : player,characters: characters)
        return newTeam
    }
    
    //Function which display informations to give a choice to a player on which character does he want.
    private static func choiceEntry(_ playerName : String) -> String{
        print("\(playerName) which type of warrior do you want to join your team ?")
        print("1 - Combattant 2 - Nain 3 - Colosse 4 - Mage")
        print("\(playerName), please enter the corresponding number to the type of champion you desire:")
        if let choice = readLine(){
            switch choice {
            case "1","2","3","4" :
                return choice
            default :
                print("Your choice is not available, choose a number between 1 and 4.")
                let err = Game.choiceEntry(playerName)
                return err
            }
        }
        print("Your choice is not available or you didn't chose anything, choose a number between 1 and 4.")
        let err = Game.choiceEntry(playerName)
        return err
    }
    
    
    func battleTurn(){
        print("Which character do you want to act ?")
        let characterTurn = characterSuitable(team: team1)
        print("On which target do you want \(characterTurn.name) to attack ?")
        let target = characterSuitable(team: team2)
        characterTurn.action(target: target)
    }
    
    private func characterSelection(team : Team) -> Personnage{
        team.displayTeamMembers()
        if let num = readLine() {
            if let numberOfCharacter = Int(num){
                if 1...3 ~= numberOfCharacter {
                    return team.characters[numberOfCharacter - 1]
                }
            }
            print("This is not a valid number")
        }
        let err = characterSelection(team: team)
        return err
    }
    
    private func characterSuitable(team : Team) -> Personnage{
        let character = characterSelection(team: team)
        if character.isDead {
            print("The character that you have chosen is dead, please choose another one.")
            let err = characterSuitable(team: team)
            return err
        }
        return character
    }
    
    
    
}
