//
//  ExampleInteractor.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//

import Foundation

protocol ExampleBusinessLogic: class {
  func loadTodos()
}

class ExampleInteractor {
  weak var presenter: ExampleBusinessPresentingLogic?
  lazy var todosWorker = ExampleTodosWorker()
}

// MARK: - ExampleBusinessLogic
extension ExampleInteractor: ExampleBusinessLogic {
  func loadTodos() {
    print(#function)
    let todos = todosWorker.loadTodos()
    presenter?.presentTodos(todos)
  }
}
