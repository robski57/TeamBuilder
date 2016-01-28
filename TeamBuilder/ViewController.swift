//
//  ViewController.swift
//  TeamBuilder
//
//  Created by Robert Masen on 1/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var PlayerTextBox: UITextField!
    @IBOutlet weak var PlayersTable: UITableView!

    var addedPlayers = [Player]()
    var teamSize: Int?
    var possibleTeamSize = (1...100).map { $0 }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.PlayerTextBox.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return possibleTeamSize.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(possibleTeamSize[row])"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        teamSize = row + 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addedPlayers.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Default Tasks")
        cell.textLabel?.text = addedPlayers[indexPath.row].Name
        return cell
    }
    
    @IBAction func AddPlayerButtonClick(sender: AnyObject) {
        if PlayerTextBox.text != "" {
        addPlayer(PlayerTextBox.text!)
        PlayersTable.reloadData()
        }
    }
    
    @IBAction func touchoutofbox(sender: AnyObject) {
        PlayerTextBox.resignFirstResponder()
        PlayerTextBox.endEditing(true)
    }
    
    @IBAction func AddPlayerEnterKey(sender: AnyObject) {
        if PlayerTextBox.text != "" {
            addPlayer(PlayerTextBox.text!)
            PlayersTable.reloadData()
        }
    }
    @IBAction func BuildTeamsButtonClick(sender: AnyObject){
        teamController = TeamController(players: addedPlayers, teamSize: teamSize!)
    }
    
    func addPlayer(playerName: String){
        addedPlayers.append(Player(name: playerName))
        PlayerTextBox.text = ""
    }
}