//
//  FriendsListTableViewController.swift
//  VKTestApp
//
//  Created by Kamila on 17.01.2022.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    var contactList: [FirendsListCellModel] = [.init(name: "Pavel", surnname: "Durov", imageName: "pavel") , .init(name: "Goobkabob", surnname: "Kvadratnieshtani", imageName: "bob") , .init(name: "Patric", surnname: "Star", imageName: "star")]
    var selectedFriend: FirendsListCellModel?
    var index = 0

    var headerList = ["D", "K", "S"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return headerList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        MARK: example how to use different type cell
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "testId", for: indexPath)
//            cell.textLabel?.text = name
//            cell.textLabel?.backgroundColor = .green
//            return cell
//        } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListTableViewCellId", for: indexPath) as! FriendsListTableViewCell
        cell.setData(with: contactList[index])
        index += 1
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Friends"
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: .init(x: 0, y: 0, width: 375, height: 100))
        headerView.setText(headerList[section])
        headerView.backgroundColor = .lightGray
        headerView.layer.opacity = 0.4
        return headerView
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFriend = contactList[indexPath.section]
        performSegue(withIdentifier: "seeFriendPhoto", sender: selectedFriend)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seeFriendPhoto" {
            guard let friendController = segue.destination as? PhotoListCollectionViewController,
            let model = sender as? FirendsListCellModel else { return }

            friendController.listPhoto.imageName[0] = model.imageName
            friendController.listPhoto.imageName[1] = "naruto"
            friendController.listPhoto.friendName = model.name + " " + model.surnname
            friendController.listPhoto.likeCount = 0
            friendController.listPhoto.liked = false

        }
    }


    
}

private extension FriendsListTableViewController {
    func registerTableViewCells() {
        // For nib
        tableView.register(FriendsListTableViewCell.nib(), forCellReuseIdentifier: "FriendsListTableViewCellId")
        // For default and custom(code) cell
    }


}



