//
//  ReusableView.swift
//  Template
//
//  Created by Domagoj Kulundzic on 17/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import UIKit

public protocol ReusableView {
	static var defaultReuseIdentifier: String { get }
}

extension UIView: ReusableView {
	public static var defaultReuseIdentifier: String {
		return String(describing: self)
	}
}
