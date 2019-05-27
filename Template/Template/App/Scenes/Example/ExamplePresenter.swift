//
//  ExamplePresenter.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//  Copyright © 2019 Martian & Machine. All rights reserved.
//

import Foundation

protocol ExampleViewPresentingLogic: class {
  func viewLoaded()
}

protocol ExampleBusinessPresentingLogic: class {
  func presentTodos(_ todos: [Any])
}

class ExamplePresenter {
  var interactor: ExampleBusinessLogic?
  weak private var view: ExampleDisplayLogic?
  private let router: ExampleRoutingLogic
  
  init(interface: ExampleDisplayLogic, interactor: ExampleBusinessLogic?, router: ExampleRoutingLogic) {
    self.view = interface
    self.router = router
    self.interactor = interactor
  }
}

// MARK: - ExampleViewPresentingLogic
extension ExamplePresenter: ExampleViewPresentingLogic {
  func viewLoaded() {
    print(#function)
    interactor?.loadTodos()
  }
}

// MARK: - ExampleBusinessPresentingLogic
extension ExamplePresenter: ExampleBusinessPresentingLogic {
  func presentTodos(_ todos: [Any]) {
    print(#function)
    view?.displayTodos()
  }
}
