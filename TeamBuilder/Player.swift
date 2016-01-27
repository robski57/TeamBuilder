//
//  Player.swift
//  TeamBuilder
//
//  Created by Robert Masen on 1/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class Player {
    
    var ID: Int

    var Name: String
    
    init(name: String) {
        Name = name
        ID = Int(arc4random_uniform(100))
    }
    
    func resetID(){
        self.ID = Int(arc4random_uniform(100))
    }
}