//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

protocol ___VARIABLE_moduleName___RoutingLogic { }

protocol ___VARIABLE_moduleName___RouterDelegate: class { }

class ___VARIABLE_moduleName___Router {
  weak var viewController: ___VARIABLE_moduleName___ViewController?
  weak var delegate: ___VARIABLE_moduleName___RouterDelegate?
}

// MARK: - Routing Logic
extension ___VARIABLE_moduleName___Router: ___VARIABLE_moduleName___RoutingLogic { }
