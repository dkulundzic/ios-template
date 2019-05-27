//
//  UIColor-Template.swift
//  Template
//
//  Created by Domagoj Kulundzic on 17/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import UIKit

public extension UIColor {
	convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1) {
		self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
	}
	
	convenience init(value: Int, alpha: CGFloat = 1) {
		self.init(red: CGFloat(value) / 255, green: CGFloat(value) / 255, blue: CGFloat(value) / 255, alpha: alpha)
	}
}
