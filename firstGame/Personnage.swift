//
//  Personnage.swift
//  firstGame
//
//  Created by Alex on 16/10/2018.
//  Copyright © 2018 Alexandre Holet. All rights reserved.
//

import Foundation

class Personnage{
    static var names = Set<String>()
    var name = ""
    var lifePoints = 0
    
    
    init(name : String){
        if Personnage.existingName(nameWeWant: name){
        } else {
            Personnage.names.insert(name)
            self.name = name
        }
    }
    
    static func existingName(nameWeWant : String) -> Bool {
        return names.contains(nameWeWant)
    }
    
    func displayName(){
        print("My name is \(name)")
    }
}
