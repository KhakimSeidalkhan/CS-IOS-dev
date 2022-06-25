//
//  GroupListCellTableViewCell.swift
//  project
//
//  Created by Khakim on 31.01.2022.
//

import UIKit

class GroupListCellTableViewCell: UITableViewCell {

    static func nib() -> UINib {
        return UINib(nibName: "GroupListCellTableViewCell", bundle: nil)
    }

    @IBOutlet private var groupName: UILabel?
    @IBOutlet private var groupImage: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(with data: GroupsListCellModel) {
        groupName?.text = data.name
        groupImage?.layer.cornerRadius = 25
        groupImage?.clipsToBounds = true
        groupImage?.image = UIImage(named: data.iconName)
    }
    
}
