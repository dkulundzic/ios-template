//
//  SectionProtocol.swift
//  O2O
//
//  Created by Domagoj Kulundzic on 17/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

protocol SectionProtocol {
	associatedtype Item
	var items: [Item] { get }
	var isCollapsed: Bool { get }
}

extension SectionProtocol {
	var isCollapsed: Bool {
		return false
	}
	
	func item(at index: Int) -> Item? {
		return items[safe: index]
	}
}
