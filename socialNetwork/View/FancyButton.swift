//
//  FancyButton.swift
//  socialNetwork
//
//  Created by Donna Samuel on 20/1/18.
//  Copyright © 2018 donnasamuel. All rights reserved.
//

import UIKit

class FancyButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.4).cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5.0
        layer.cornerRadius = 8.0
    }

}
