//
//  NotFollowedGroupsTableViewController.swift
//  project
//
//  Created by Khakim on 31.01.2022.
//

import UIKit

class NotFollowedGroupsTableViewController: UITableViewController {

    var notFollowedGroupsList: [GroupsListCellModel] = [.init(name: "BTS fans", iconName: "bts")]
    var selectedGroup: GroupsListCellModel?
    
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
        return self.notFollowedGroupsList.count
    }


    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let myAdd = UIContextualAction(style: .destructive, title: nil) { (_, _, compilationHand) in
            self.notFollowedGroupsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        myAdd.image = UIImage(systemName: "plus")
        myAdd.backgroundColor = .systemBlue

        return UISwipeActionsConfiguration(actions: [myAdd])

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGroup = notFollowedGroupsList[indexPath.row]
        notFollowedGroupsList.remove(at: indexPath.row)
        performSegue(withIdentifier: "joinGroup", sender: nil)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupListCellTableViewCellId", for: indexPath) as! GroupListCellTableViewCell

        cell.setData(with: self.notFollowedGroupsList[indexPath.row])

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

private extension NotFollowedGroupsTableViewController {

    func register(){
        tableView.register(GroupListCellTableViewCell.nib(), forCellReuseIdentifier: "GroupListCellTableViewCellId")
    }
}
