//
//  FriendsListTableViewCell.swift
//  VKTestApp
//
//  Created by Kamila on 17.01.2022.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: "FriendsListTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var contactImageView: UIImageView?
   
    override func awakeFromNib() {
        super.awakeFromNib()

    }


//    override func setSelected(_ selected: Bool, animated: Bool) {
//        UIView.animate(withDuration: 10, delay: 10, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .autoreverse) {
//            self.contactImageView?.alpha = 0
//        }
//
//    }
    
    func setData(with data: FirendsListCellModel) {
        titleLabel?.text = data.name + " " + data.surnname
        //contactImageView?.layer.cornerRadius = 25
        contactImageView?.clipsToBounds = true
        contactImageView?.layer.shadowColor = UIColor.blue.cgColor
        contactImageView?.layer.shadowOffset = CGSize.zero
        contactImageView?.layer.shadowOpacity = 0.4
        contactImageView?.layer.shadowRadius = 30
        //contactImageView?.layer.masksToBounds = false
        contactImageView?.layer.cornerRadius = 25
        contactImageView?.image = UIImage(named: data.imageName)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        contactImageView?.isUserInteractionEnabled = true
        contactImageView?.addGestureRecognizer(tapGestureRecognizer)
    }


    @objc func imageTapped(_ tapGestureTecognizer: UITapGestureRecognizer){
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .autoreverse) {
            self.contactImageView?.transform3D = CATransform3DMakeScale(0.8, 0.8, 1)
        } completion: { _ in
            self.contactImageView?.transform3D = CATransform3DMakeScale(1, 1, 1)
        }

    }
}
