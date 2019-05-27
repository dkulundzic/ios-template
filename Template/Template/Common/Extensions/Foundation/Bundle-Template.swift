//
//  Bundle-Template.swift
//  Template
//
//  Created by Domagoj Kulundzic on 25/09/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

public extension Bundle {
	var appVersion: String? {
		return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
	}
	
	var buildNumber: String? {
		return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
	}
}
