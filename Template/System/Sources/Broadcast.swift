//
//  Broadcast.swift
//  Template
//
//  Created by Domagoj Kulundzic on 18/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

public class Broadcast<T> {	
	private(set) var delegates = [Weak<AnyObject>]()
	
	public init() { }
	
	public func add(delegate: T) {
		prune()
		delegates.append(Weak<AnyObject>(delegate as AnyObject))
	}
	
	public func remove(delegate: T) {
		prune()
		guard let index = delegates.firstIndex(where: {
			guard let reference = $0.reference else { return false }
			return reference === delegate as AnyObject
		}) else { return }
		delegates.remove(at: index)
	}
	
	public func invoke(invocation: (T) -> Void) {
		delegates.reversed().forEach {
			guard let delegate = $0.reference as? T else { return }
			invocation(delegate)
		}
	}
	
	public func invoke(on queue: DispatchQueue = .main, invocation: @escaping (T) -> Void) {
		queue.async {
			self.invoke(invocation: invocation)
		}
	}
	
	public func clear() {
		delegates.removeAll()
	}
	
	private func prune() {
		delegates = delegates.filter { $0.reference != nil }
	}
}
