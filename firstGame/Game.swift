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
        print("Swordsman : The classic warrior, a reasonnable choice for who wants to hurt.")
        print("Mage : The only guy who takes care of others in this group, an healer.")
        print("Colossus : He won't hurt you very bad but he can take a lot.")
        print("Dwarf : His axe is very efficient but his health points are quite low.")
    }
    
    //Function which creates characters and put them in a new team
    private static func teamRecrutment(_ teamNumber : Int) -> Team{
        var choice = ""
        var character : Character
        var characters = [Character]()
        let name = Player.readName()
        let player = Player( team : teamNumber == 1 ? .teamOne : .teamTwo, name : name)
        Game.introDisplay(teamNumber : teamNumber, name : name)
        
        for _ in 1...3{
            choice = Game.choiceEntry(name)
            character = Character.createCharacter(choice : choice)
            characters.append(character)
        }
        
        let newTeam = Team(player : player,characters: characters)
        return newTeam
    }
    
    //Function which display informations to give a choice to a player on which character does he want.
    private static func choiceEntry(_ playerName : String) -> String{
        print("\n\(playerName), which type of warrior do you want to join your team ?")
        print("1 - Swordsman 2 - Dwarf 3 - Colossus 4 - Mage")
        print("\n\(playerName), please enter the corresponding number to the type of champion you desire:")
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
    
    //Function which leads a battle turn
    private func battleTurn(teamTurn : Team, attackChest : Chest, healChest : Chest){
        let target : Character
        print("\nWhich character do you want to act ?")
        let characterTurn = characterSuitable(team: teamTurn)
        if Game.isHealer(character: characterTurn) {
            if healChest.isAppeared() {
                characterTurn.equipNewWeapon(weapon: healChest.weaponSelected())
                print("Healing <<\n")
            }
            print("Which character do you want \(characterTurn.name) to heal ?")
            target = characterSuitable(team: teamTurn)
        } else {
            if attackChest.isAppeared(){
                characterTurn.equipNewWeapon(weapon: attackChest.weaponSelected())
                print("DMG <<\n")
            }
            print("Which character do you want \(characterTurn.name) to attack ?")
            target = characterSuitable(team: teamTurn.teamNumber == team1.teamNumber ? team2 : team1)
        }
        characterTurn.action(target: target)
    }
    
    
    //Function which selects a character with a number entered by the player
    private func characterSelection(team : Team) -> Character{
        team.displayTeamMembers()
        if let num = readLine() {
            if let numberOfCharacter = Int(num){
                if 1...3 ~= numberOfCharacter {
                    return team.characters[numberOfCharacter - 1]
                }
            }
            print("This is not a valid number, please enter a number between 1 and 3")
        }
        let err = characterSelection(team: team)
        return err
    }
    
    //Function which checks if the character selected is dead or not, call itself if he is.
    private func characterSuitable(team : Team) -> Character{
        let character = characterSelection(team: team)
        if character.isDead {
            print("The character that you have chosen is dead, please choose another one.")
            let err = characterSuitable(team: team)
            return err
        }
        return character
    }
    
    //Function which return true if the character is a Healer
    private static func isHealer(character : Character) -> Bool {
        if let _ = character as? Healer {
            return true
        }
        return false
    }
    
    //Function which leads a game
    static func play(){
        let game = Game()
        var i = 1
        var finish = false
        let healChest = Chest(chestType: .healChest)
        let attackChest = Chest(chestType: .attackChest)
        
        
        game.team1.displayTeamMembers()
        game.team2.displayTeamMembers()
        while !finish {
            let teamTurn = i%2 == 1 ? game.team1 : game.team2
            game.battleTurn(teamTurn: teamTurn, attackChest: attackChest, healChest: healChest)
            i += 1
            finish = (teamTurn.teamNumber == game.team1.teamNumber ? game.team2 : game.team1).isDead(winner : teamTurn.player)
        }
        if Game.replayEntry(){
            print("Let's roll for another one")
            Game.play()
        }
    }
    
    private static func replayEntry() -> Bool{
        print("Do you want to replay ? 1- Yes  2- No")
        if let entry = readLine() {
            switch entry{
            case "1":
                return true
            case "2":
                return false
            default:
                print("Your must choose option one or two, please try again")
                let err = replayEntry()
                return err
            }
        }
        let err = replayEntry()
        return err
    }
    
}
