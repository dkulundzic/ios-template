//
//  ExampleNavigationInteractor.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//  Copyright © 2019 Martian & Machine. All rights reserved.
//

import Foundation

protocol ExampleNavigationBusinessLogic: class { }

class ExampleNavigationInteractor {
  weak var presenter: ExampleNavigationBusinessPresentingLogic?
}

// MARK: - ExampleNavigationBusinessLogic
extension ExampleNavigationInteractor: ExampleNavigationBusinessLogic { }
