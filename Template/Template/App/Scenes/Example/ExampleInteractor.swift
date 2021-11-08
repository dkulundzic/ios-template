//
//  ExampleInteractor.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//

import Foundation

protocol ExampleBusinessLogic: AnyObject {
  func loadTodos()
}

class ExampleInteractor {
  weak var presenter: ExampleBusinessPresentingLogic?
}

// MARK: - ExampleBusinessLogic
extension ExampleInteractor: ExampleBusinessLogic {
  func loadTodos() {
    print(#function)
  }
}
