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
        Game.introDisplay(1)
        // Constitution of the teams
        team1 = Game.teamRecrutment(1)
        Game.introDisplay(2)
        team2 = Game.teamRecrutment(2)
    }
    
    //Function with prints which display the caracteristics of all characters, teamNumber required to adjust display
    private static func introDisplay(_ teamNumber : Int){
        print("Player \(teamNumber == 1 ? "one" : "two") you must choose three characters to complete your team.")
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
        
        for _ in 1...3{
            choice = Game.choiceEntry(teamNumber)
            character = Game.createCharacter(choice : choice)
            characters.append(character)
        }
        
        let newTeam = Team(teamNumber: teamNumber==1 ? .teamOne : .teamTwo,characters: characters)
        return newTeam
    }
    
    //Function which display informations to give a choice to a player on which character does he want.
    private static func choiceEntry(_ teamNumber : Int) -> String{
        print("Player \(teamNumber == 1 ? "one" : "two") which type of warrior will join your team ?")
        print("1 - Combattant 2 - Nain 3 - Colosse 4 - Mage")
        print("Player \(teamNumber == 1 ? "one" : "two") enter the corresponding number to the type of champion you desire:")
        if let choice = readLine(){
            switch choice {
            case "1","2","3","4" :
                return choice
            default :
                print("Your choice is not available, choose a number between 1 and 4.")
                let err = Game.choiceEntry(teamNumber)
                return err
            }
        }
        print("Your choice is not available or you didn't chose anything, choose a number between 1 and 4.")
        let err = Game.choiceEntry(teamNumber)
        return err
    }
    
    // soucis si j'initialise avant le switch il me renvoie les deux "personnages"
    // Function which creates the characters with a name given by the player.
    private static func createCharacter(choice : String) -> Personnage{
        switch choice {
        case "1" :
            let character = Combattant(name: Game.nameEntry(warriorType: "Combattant"))
            return character
        case "2" :
            let character = Nain(name : Game.nameEntry(warriorType: "Nain"))
            return character
        case "3" :
            let character = Colosse(name : Game.nameEntry(warriorType: "Colosse"))
            return character
        case "4" :
            let character = Mage(name : Game.nameEntry(warriorType: "Mage"))
            return character
        default :
            print("impossible de se retrouver ici, createCharacter")
        }
        let character = Colosse(name : "default")
        return character
    }
    
    //Function which save the name entries by the player and return it.
    private static func nameEntry(warriorType : String) -> String{
        print("Which name do you want for your \(warriorType) ?")
        if let name = readLine(){
            if Personnage.existingName(nameWeWant: name){
                print("Name already taken for one character, please pick a new one.")
                let newName = Game.nameEntry(warriorType: warriorType)
                return newName
            } else {
                return name
            }
        }
        print("You don't choose a name or a problem occured, pls try again")
        let err=Game.nameEntry(warriorType: warriorType)
        return err
    }
    
    
    
}
