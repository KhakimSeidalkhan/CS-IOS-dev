//
//  GroupsListTableViewController.swift
//  project
//
//  Created by Khakim on 31.01.2022.
//

import UIKit

class GroupsListTableViewController: UITableViewController {
    
    public var groupsList: [GroupsListCellModel] = [.init(name: "Naruto fan group", iconName: "naruto"), .init(name: "Itachi fan group", iconName: "itachi"), .init(name: "11A super", iconName: "class")]
    static var newGroupsList: [GroupsListCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupsList.count
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let myDel = UIContextualAction(style: .destructive, title: nil) { (_, _, compilationHand) in
            self.groupsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        myDel.image = UIImage(systemName: "trash")
        myDel.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [myDel])
        
    }
    
    @IBAction func joinGroup(segue: UIStoryboardSegue){
        if segue.identifier == "joinGroup" {
            guard let groupsController = segue.source as? NotFollowedGroupsTableViewController else { return }
            if let group = groupsController.selectedGroup {
                groupsList.append(group)
                tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupListCellTableViewCellId", for: indexPath) as! GroupListCellTableViewCell
        
        cell.setData(with: groupsList[indexPath.row])
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Groups"
    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension GroupsListTableViewController {
    
    func register(){
        tableView.register(GroupListCellTableViewCell.nib(), forCellReuseIdentifier: "GroupListCellTableViewCellId")
    }
    
}
