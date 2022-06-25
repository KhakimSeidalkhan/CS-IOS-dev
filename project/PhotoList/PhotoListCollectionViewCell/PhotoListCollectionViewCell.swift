//
//  PhotoListCollectionViewCell.swift
//  project
//
//  Created by Khakim on 02.02.2022.
//

import UIKit

class PhotoListCollectionViewCell: UICollectionViewCell {

    static func nib() -> UINib {
        return UINib(nibName: "PhotoListCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCountView: UILabel!
    @IBOutlet weak var likeCountViewTwo: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    var currentImage = 0
    var flag = false
    var likeCount = 99 {
        didSet{
            //likeCountView?.text = String(likeCount)
            flag = !flag
        }
    }


    func setData(with data: PhotoListModel) {
        friendName.text = data.friendName
        likeCountView?.text = String(likeCount)
        likeCountViewTwo?.text = ""
        likeCountViewTwo?.alpha = 0
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: data.imageName[currentImage])
        imageTwo.image = UIImage(named: data.imageName[currentImage+1])
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.addTarget(self, action: #selector(like(_:)), for: .touchUpInside)
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(_:)))
        swipeLeftRecognizer.direction = UISwipeGestureRecognizer.Direction.left
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(_:)))
        swipeRightRecognizer.direction = UISwipeGestureRecognizer.Direction.right
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(swipeLeftRecognizer)
        imageTwo.isUserInteractionEnabled = true
        imageTwo.addGestureRecognizer(swipeRightRecognizer)
    }

    @objc func swipeLeft(_ swipe: UISwipeGestureRecognizer){
        UIView.animateKeyframes(withDuration: 0.8, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.imageView.transform3D = CATransform3DMakeScale(0.8, 0.8, 1)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.5) {
                self.imageView.transform = CGAffineTransform(translationX: -375, y: 0)
                self.imageTwo.transform = CGAffineTransform(translationX: -375, y: 0)
            }
        }, completion: { _ in
            self.imageView.transform3D = CATransform3DMakeScale(1, 1, 1)
            self.imageView.transform = CGAffineTransform(translationX: -375, y: 0)
        })

    }

    @objc func swipeRight(_ swipe: UISwipeGestureRecognizer){
        UIView.animateKeyframes(withDuration: 0.8, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.imageTwo.transform3D = CATransform3DMakeScale(0.8, 0.8, 1)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.5) {
                self.imageTwo.transform = CGAffineTransform(translationX: 375, y: 0)
                self.imageView.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        }, completion: { _ in
            //self.imageTwo.transform3D = CATransform3DMakeScale(1, 1, 1)
            self.imageTwo.transform = CGAffineTransform(translationX: 375, y: 0)
        })
    }

    @objc func like(_ sender: UIButton) {

        switch flag {
        case true:
            self.likeCount -= 1
            self.likeCountView?.text = String(likeCount)
            UIView.animate(withDuration: 0.3, delay: 0) {
                self.likeCountView?.alpha = 1
                self.likeCountView?.transform = CGAffineTransform(translationX: 0, y: 0)
                self.likeCountViewTwo?.alpha = 0
                self.likeCountViewTwo.transform = CGAffineTransform(translationX: 0, y: -12)
            }

            self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)

        case false:
            self.likeCount += 1
            self.likeCountViewTwo?.text = String(likeCount)

            UIView.animate(withDuration: 0.3, delay: 0) {
                self.likeCountView?.alpha = 0
                self.likeCountView?.transform = CGAffineTransform(translationX: 0, y: 12)
                self.likeCountViewTwo?.alpha = 1
                self.likeCountViewTwo.transform = CGAffineTransform(translationX: 0, y: 12)
            }

            self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
}
