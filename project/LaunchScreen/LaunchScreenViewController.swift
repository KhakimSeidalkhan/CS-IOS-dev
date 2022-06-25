//
//  LaunchScreenViewController.swift
//  project
//
//  Created by Khakim on 06.02.2022.
//

import UIKit

class LaunchScreenViewController: UIViewController {


    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        animateFirstIcon()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func animateFirstIcon() {
        UIView.animate(withDuration: 0.55, delay: 0) {
            self.imageThree.alpha = 0
            self.imageOne.alpha = 1
        } completion: { _ in
            self.animateSecondIcon()
        }

    }

    private func animateSecondIcon() {
        UIView.animate(withDuration: 0.55, delay: 0) {
            self.imageTwo.alpha = 1
            self.imageOne.alpha = 0
        } completion: {  _ in
            self.animateThirdIcon()
        }

    }

    private func animateThirdIcon() {
        UIView.animate(withDuration: 0.55, delay: 0) {
            self.imageThree.alpha = 1
            self.imageTwo.alpha = 0
        } completion: { _ in
            self.animateFirstIcon()
        }

    }



}
