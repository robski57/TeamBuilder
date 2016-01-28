//
//  ViewController.swift
//  TeamBuilder
//
//  Created by Robert Masen on 1/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate  {
    
    //Variables
    @IBOutlet var nameTable: UITableView!
    
    @IBOutlet weak var nameTextBox: UITextField!
    
    @IBOutlet weak var teamSizePicker: UIPickerView!
    
    var playerList = [String]()
    
    let teamSize = (1...100).map { $0 }
    var selectedTeamSize: Int?
    
    
    //System methods
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Picker View
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let teamValue = teamSize[row]
        return "\(teamValue)"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //TODO: add code
        selectedTeamSize = row + 1
    }
    
    //Name Add Button
    @IBAction func addNameButton(sender: UIButton) {
        let nameToAdd = nameTextBox.text
        playerList.append(nameToAdd!)
        nameTable.reloadData()
    }
    
    //Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentCell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        currentCell.textLabel?.text = playerList[indexPath.row]
        return currentCell
    }
}

