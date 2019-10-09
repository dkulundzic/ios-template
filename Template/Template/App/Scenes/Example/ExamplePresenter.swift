//
//  ExamplePresenter.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//

import Foundation

protocol ExampleViewPresentingLogic: class {
  func viewLoaded()
  func viewAppeared()
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
  
  func viewAppeared() {
    print(#function)
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      self.router.navigateToExampleNavigation()
    }
  }
}

// MARK: - ExampleBusinessPresentingLogic
extension ExamplePresenter: ExampleBusinessPresentingLogic {
  func presentTodos(_ todos: [Any]) {
    print(#function)
    view?.displayTodos()
  }
}
