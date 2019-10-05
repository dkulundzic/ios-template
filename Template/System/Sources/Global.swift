//
//  Global.swift
//  Template
//
//  Created by Domagoj Kulundzic on 24/07/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

/// Typealiases a single argumentless/voidless closure.
public typealias Action = () -> Void

/// Typealiases a parametrised single voidless closure.
public typealias ParametrisedAction<T> = (T) -> Void

/// Typealiases a success handler.
public typealias SuccessHandler<T> = ((T) -> Void)?

/// Typealiases a argumentless success handler.
public typealias ArgumentlessSuccessHandler = (() -> Void)?

/// Typealiases a failure handler.
public typealias FailureHandler = ((Error) -> Void)?

/// Invokes the action only if the current configuration is DEBUG.
public func whenDebug(_ action: Action?) {
	#if DEBUG
	action?()
	#endif
}

/// Invokes the action only if the current configuration is RELEASE.
public func whenRelease(_ action: Action?) {
	#if DEBUG
	#else
	action?()
	#endif
}
