//
//  CircleView.swift
//  socialNetwork
//
//  Created by Donna Samuel on 25/1/18.
//  Copyright © 2018 donnasamuel. All rights reserved.
//

import UIKit
class CircleView: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
    }
}
