//
//  SectionProtocol.swift
//  Template
//
//  Created by Domagoj Kulundzic on 17/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

public protocol SectionProtocol {
	associatedtype Item
	var items: [Item] { get }
	var isCollapsed: Bool { get }
}

public extension SectionProtocol {
	var isCollapsed: Bool {
		return false
	}
	
	func item(at index: Int) -> Item? {
		return items[safe: index]
	}
}
