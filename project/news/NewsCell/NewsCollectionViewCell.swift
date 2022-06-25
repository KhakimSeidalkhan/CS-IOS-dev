//
//  NewsCollectionViewCell.swift
//  project
//
//  Created by Khakim on 03.02.2022.
//

import UIKit
import CoreData

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var timeCreated: UILabel!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsComment: UIButton!
    @IBOutlet weak var newsShare: UIButton!
    @IBOutlet weak var likeCounView: UILabel!
    @IBOutlet weak var newsLike: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    var flag = false
    var likeCount = 0 {
        didSet{
            likeCounView?.text = String(likeCount)
            flag = !flag
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "NewsCollectionViewCell", bundle: nil)
    }

    func setData(_ data: News) {
        groupImage.layer.cornerRadius = 25
        groupImage.clipsToBounds = true
        groupImage.image = UIImage(named: data.logo!)
        groupName.text = data.name!
        newsText.text = data.text!
        newsImage.layer.cornerRadius = 10
        newsImage.clipsToBounds = true
        newsImage.image = UIImage(named: data.photo!)
        newsLike.setImage(UIImage(systemName: "heart"), for: .normal)
        newsLike.addTarget(self, action: #selector(like(_:)), for: .touchUpInside)
    }

    @objc func like(_ sender: UIButton) {

        switch flag {
        case true:
            self.likeCount -= 1
            self.newsLike.setImage(UIImage(systemName: "heart"), for: .normal)
            self.likeCounView?.textColor = UIColor.black

        case false:
            self.likeCount += 1
            self.newsLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self.likeCounView?.textColor = UIColor.red
        }
    }
    

}
