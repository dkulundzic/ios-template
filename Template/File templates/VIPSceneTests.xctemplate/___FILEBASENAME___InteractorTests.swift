//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import XCTest

@testable import Chedda

class ___VARIABLE_moduleName___InteractorTests: XCTestCase {
  private let interactor = ___VARIABLE_moduleName___Interactor()
  private let presenterInjector = PresenterInjector()
  
  override func setUp() {
    super.setUp()
    interactor.presenter = presenterInjector
  }
}

// MARK: - PresenterInjector
private class PresenterInjector: ___VARIABLE_moduleName___PresentationLogic {
 
}
