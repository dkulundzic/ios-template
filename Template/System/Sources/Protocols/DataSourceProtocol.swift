//
//  DataSourceProtocol.swift
//  Template
//
//  Created by Domagoj Kulundzic on 17/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

public protocol DataSourceProtocol {
	associatedtype Section: SectionProtocol
	var sections: [Section] { get }
	var isEmpty: Bool { get }
}

public extension DataSourceProtocol {
	var isEmpty: Bool {
		guard numberOfSections() > 0 else {
			return true
		}
		guard sections.first(where: { !$0.items.isEmpty }) != nil else {
			return true
		}
		return false
	}
	
	func numberOfSections() -> Int {
		return sections.count
	}
	
	func numberOfItems(in section: Int) -> Int {
		guard let section = sections[safe: section] else { return 0 }
		return section.isCollapsed ? 0 : section.items.count
	}
	
	func section(at index: Int) -> Section? {
		return sections[safe: index]
	}
	
	func item(at indexPath: IndexPath) -> Section.Item? {
		return section(at: indexPath.section)?.item(at: indexPath.item)
	}
}
