//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import XCTest

@testable import Chedda

class ___VARIABLE_moduleName___PresenterTests: XCTestCase {
  private let presenter = ___VARIABLE_moduleName___Presenter()
  private let viewControllerInjector = ViewControllerInjector()
  
  override func setUp() {
    super.setUp()
    presenter.viewController = viewControllerInjector
  }
}

// MARK: - ViewControllerInjector
private class ViewControllerInjector: ___VARIABLE_moduleName___DisplayLogic {

}
