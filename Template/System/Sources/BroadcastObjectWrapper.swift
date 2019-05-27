//
//  BroadcastObjectWrapper.swift
//  Template
//
//  Created by Domagoj Kulundzic on 18/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

internal class Weak<T: AnyObject> {
	weak var reference: T?
	
	init(_ object: T) {
		self.reference = object
	}
}
