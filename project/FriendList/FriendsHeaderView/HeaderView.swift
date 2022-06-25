//
//  HeaderView.swift
//  project
//
//  Created by Khakim on 03.02.2022.
//

import UIKit

class HeaderView: UIView {

    private let titleLabel = UILabel()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.

    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 10, y: 0, width: 200, height: 30)
    }

    func setText(_ text: String) {
        titleLabel.text = text
    }

}
