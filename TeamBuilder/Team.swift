//
//  Team.swift
//  TeamBuilder
//
//  Created by Robert Masen on 1/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class Team {
    var Players: [Player]
    
    init(){
        Players = [Player]()
    }
    
    func addPlayer(player: Player){
        Players.append(player)
    }
    
    func removeAllPlayers(){
        Players.removeAll()
    }
}