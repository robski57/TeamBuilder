//
//  TeamController.swift
//  TeamBuilder
//
//  Created by Robert Masen on 1/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class TeamController {
    
    var Teams = [Team]()
    var Players: [Player]
    var TeamSize: Int
    
    init(players: [Player], numberOfTeams: Int){
        self.Players = players
        self.TeamSize = numberOfTeams
        self.Teams.append(Team())
    }
    
    func createTeams(){
        sortPlayers()
        buildTeams()
        }
    
    func sortPlayers(){
         Players.sortInPlace { (p1, p2) -> Bool in
            p1.ID > p2.ID
        }
    }
    
    func buildTeams() {
        var team = 0
        var playersAdded = 1
        for player in Players {
            Teams[team].addPlayer(player)
            playersAdded++
            if Teams[team].Players.count == TeamSize {
                team++
                Teams.append(Team())
            }
        }

    }
}