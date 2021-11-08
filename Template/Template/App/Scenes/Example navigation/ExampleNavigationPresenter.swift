//
//  ExampleNavigationPresenter.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//

import Foundation

protocol ExampleNavigationPresentingLogic: AnyObject {
  func viewLoaded()
}

protocol ExampleNavigationBusinessPresentingLogic: AnyObject { }

class ExampleNavigationPresenter {
  var interactor: ExampleNavigationBusinessLogic?
  weak private var view: ExampleNavigationDisplayLogic?
  private let router: ExampleNavigationRoutingLogic
  
  init(interface: ExampleNavigationDisplayLogic, interactor: ExampleNavigationBusinessLogic?, router: ExampleNavigationRoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - ExampleNavigationPresentingLogic
extension ExampleNavigationPresenter: ExampleNavigationPresentingLogic {
  func viewLoaded() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      self.router.unwindBack()
    }
  }
}

// MARK: - ExampleNavigationBusinessPresentingLogic
extension ExampleNavigationPresenter: ExampleNavigationBusinessPresentingLogic { }
