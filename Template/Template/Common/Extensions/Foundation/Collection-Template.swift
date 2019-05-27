//
//  Collection-Template.swift
//  Template
//
//  Created by Domagoj Kulundzic on 17/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

public extension Collection {
	subscript (safe index: Index) -> Element? {
		return indices.contains(index) ? self[index]: nil
	}
	
	func count(where clause: (Element) -> Bool) -> Int {
		return filter(clause).count
	}
}
