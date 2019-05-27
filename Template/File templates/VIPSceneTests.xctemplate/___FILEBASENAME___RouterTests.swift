//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import XCTest

@testable import Chedda

class ___VARIABLE_moduleName___RouterTests: XCTestCase {
  private let router = ___VARIABLE_moduleName___Router()
  private let delegateInjector = DelegateInjector()
  private lazy var viewController = ___VARIABLE_moduleName___ViewController(delegate: delegateInjector)
  
  override func setUp() {
    super.setUp()
    router.viewController = viewController
    router.delegate = delegateInjector
  }
}

// MARK: - DelegateInjector
private class DelegateInjector: ___VARIABLE_moduleName___RouterDelegate {

}
