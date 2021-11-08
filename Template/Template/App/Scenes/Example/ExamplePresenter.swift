//
//  ExamplePresenter.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//

import Foundation

protocol ExamplePresentingLogic: AnyObject {
  func viewLoaded()
  func viewAppeared()
}

protocol ExampleBusinessPresentingLogic: AnyObject {
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

// MARK: - ExamplePresentingLogic
extension ExamplePresenter: ExamplePresentingLogic {
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
