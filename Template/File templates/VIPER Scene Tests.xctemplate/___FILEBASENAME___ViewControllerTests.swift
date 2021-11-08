//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import XCTest

@testable import Chedda

class ___VARIABLE_moduleName___ViewControllerTests: XCTestCase {
  private let vc = ___VARIABLE_moduleName___ViewController(delegate: nil)
  private let interactorInjector = InteractorInjector()
  private let routerInjector = RouterInjector()
  
  override func setUp() {
    super.setUp()
    vc.interactor = interactorInjector
    vc.router = routerInjector
    _ = vc.view
  }
  
  // MARK: VIP Cycle tests
  func testVIPSetup() {
    XCTAssertNotNil(vc.interactor)
    XCTAssertNotNil(vc.router)
  }
}

// MARK: - Private views
private extension ___VARIABLE_moduleName___ViewController {
  var contentView: ___VARIABLE_moduleName___ContentView? {
    return view.subviews.first as? ___VARIABLE_moduleName___ContentView
  }
}

// MARK: - InteractorInjector
private class InteractorInjector: ___VARIABLE_moduleName___BusinessLogic {

}

// MARK: - RouterInjector
private class RouterInjector: ___VARIABLE_moduleName___RoutingLogic {

}
