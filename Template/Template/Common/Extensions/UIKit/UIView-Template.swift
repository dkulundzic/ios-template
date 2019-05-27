//
//  UIView-Template.swift
//  Template
//
//  Created by Domagoj Kulundzic on 17/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import UIKit

// MARK: - Layout
public extension UIView {
	class func autolayoutView() -> Self {
		let view = self.init()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}
	
	func autolayoutView() -> Self {
		translatesAutoresizingMaskIntoConstraints = false
		return self
	}
}
