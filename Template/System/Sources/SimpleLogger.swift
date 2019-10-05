//
//  SimpleLogger.swift
//  Template
//
//  Created by Domagoj Kulundzic on 12/10/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

public class SimpleLogger {
	/// Defines the type of the log to be emitted.
	public enum LogType {
		case none
		case debug
		case info
		case warning
		case error
		
		/**
			Returns the **LogType** marker that's pre-pended to the Logger output statement, as follows:
			- **none** - no marker
			- **debug** - 🖥️
			- **info** - ℹ️
			- **warning** - ⚠️
			- **error** - ❌
		*/
		public var marker: String? {
			switch self {			
			case .none:
				return nil
			case .debug:
				return "🖥️"
			case .info:
				return "ℹ️"
			case .warning:
				return "⚠️"
			case .error:
				return "❌"
			}
		}
	}
	
	public static func log(_ message: CustomStringConvertible, file: String = #file, function: String = #function, line: Int = #line) {
		flush(.none, message: message, file: file, function: function, line: line)
	}
	
	public static func debug(_ message: CustomStringConvertible, file: String = #file, function: String = #function, line: Int = #line) {
		flush(.debug, message: message, file: file, function: function, line: line)
	}
	
	public static func info(_ message: CustomStringConvertible, file: String = #file, function: String = #function, line: Int = #line) {
		flush(.info, message: message, file: file, function: function, line: line)
	}
	
	public static func warning(_ message: CustomStringConvertible, file: String = #file, function: String = #function, line: Int = #line) {
		flush(.warning, message: message, file: file, function: function, line: line)
	}
	
	public static func error(_ message: CustomStringConvertible, file: String = #file, function: String = #function, line: Int = #line) {
		flush(.error, message: message, file: file, function: function, line: line)
	}
}

private extension SimpleLogger {
	static func flush(_ logType: LogType, message: CustomStringConvertible, file: String, function: String, line: Int) {
		let fileName = URL(fileURLWithPath: file).lastPathComponent.components(separatedBy: ".").first ?? ""
		if let marker = logType.marker {
			debugPrint("\(marker): \(fileName).\(function)[\(line)]: \(message)")
		} else {
			debugPrint("\(fileName).\(function)[\(line)]: \(message)")
		}
	}
}
