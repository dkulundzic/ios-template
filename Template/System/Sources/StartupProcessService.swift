//
//  StartupProcessService.swift
//  Template
//
//  Created by Domagoj Kulundzic on 18/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

/// A simple abstraction providing a clean way of executing
/// StartupProcess types.
public final class StartupProcessService {
	/// The default initialiser.
	public init() { }
}

public extension StartupProcessService {
	/// Executes a StartupProcess process.
	/// - parameter process: A concrete type conforming to StartupProcess
	@discardableResult
	func execute(process: StartupProcess) -> Self {
		process.run { success in
			if success {
				print("Successfully ran the \(type(of: process)) process.")
			}
		}
		return self
	}
}
