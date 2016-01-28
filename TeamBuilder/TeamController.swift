//
//  TeamController.swift
//  TeamBuilder
//
//  Created by Robert Masen on 1/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

var teamController: TeamController?

class TeamController  {
    
    var Teams: [Team]?
    var Players: [Player]
    var TeamSize: Int
    
    init(players: [Player], teamSize: Int){
        self.Players = players
        self.TeamSize = teamSize
        createTeams()
    }
    
    func createTeams(){
        sortPlayers()
        Teams = buildTeams()
        }
    
    func sortPlayers(){
         Players.sortInPlace { (p1, p2) -> Bool in
            p1.ID > p2.ID
        }
    }
    
    func buildTeams() -> [Team] {
        var teams = [Team]()
        teams.append(Team())
        var teamIndex = 0
        for player in Players {
            if teams[teamIndex].Players.count >= TeamSize {
                teamIndex++
                teams.append(Team())
            }
            teams[teamIndex].addPlayer(player)
                    }
        return teams
    }
}