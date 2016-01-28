//
//  TableViewController.swift
//  TeamBuilder
//
//  Created by Robert Masen on 1/27/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var teamTable: UITableView!
    var teams: [Team]?
    var teamsAndPlayers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teams = teamController!.buildTeams()
        teamsToStrings()
        teamTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Default Tasks")
        cell.textLabel?.text = teamsAndPlayers[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsAndPlayers.count
    }
    
    func teamsToStrings(){
        var i = 1
        for team in teams! {
            teamsAndPlayers.append("Team \(i)")
            i++
            for player in team.Players {
                teamsAndPlayers.append("    \(player.Name)")
            }
        }
    }
}
