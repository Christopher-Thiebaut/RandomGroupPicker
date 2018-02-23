//
//  GroupsTableViewController.swift
//  Group Randomizer
//
//  Created by Christopher Thiebaut on 2/23/18.
//  Copyright © 2018 Christopher Thiebaut. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    let groupController = RandomGroupController(groupSizeTarget: 2, groupsOfOneFine: false)

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var groupSizeLabel: UILabel!
    @IBOutlet weak var groupeSizeStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGroupSizeDisplay()
    }
    
    private func updateGroupSizeDisplay(){
        groupSizeLabel.text = "Group Size: \(Int(groupeSizeStepper.value))"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return groupController.groups.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupController.groups[section].members.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberNameCell", for: indexPath)

        if let member = groupController.groups[indexPath.section].members[indexPath.row] as? Member{
            cell.textLabel?.text = member.name
        }else{
            cell.textLabel?.text = "A serious error has occurred. Please restart the app."
            NSLog("Group contained something other than Members")
        }

        return cell
    }
    @IBAction func groupSizeStepperValueChanged(_ sender: UIStepper) {
        groupController.sizeTarget = Int(sender.value)
        updateGroupSizeDisplay()
    }
    
    @IBAction func randomizeGroupsTapped(_ sender: UIButton) {
        groupController.randomizeGroups()
        tableView.reloadData()
    }
    
    @IBAction func addMemberTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        groupController.nonRandomAddMember(withName: name)
        nameTextField.text = nil
        tableView.reloadData()
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            guard let member = groupController.groups[indexPath.section].members[indexPath.row] as? Member else {
                NSLog("Tried to delete member, but the item found was not a member.")
                return
            }
            groupController.delete(member: member)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension GroupsTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        addMemberTapped(textField)
        return true
    }
}
