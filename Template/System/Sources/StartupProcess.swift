//
//  StartupProcess.swift
//  Template
//
//  Created by Domagoj Kulundzic on 18/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

/**
	An abstraction for a predefined set of functionality, aimed to be ran once, at app startup.
*/
public protocol StartupProcess {
	var id: String { get }
	func run(completion: @escaping (Bool) -> Void)
}
