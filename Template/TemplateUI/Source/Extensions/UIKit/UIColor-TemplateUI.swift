//
//  UIColor-System.swift
//  System
//
//  Created by Domagoj Kulundzic on 08/11/2021.
//  Copyright © 2021 Codeopolis. All rights reserved.
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
