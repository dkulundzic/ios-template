//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_productName:identifier___RoutingLogic: class { }

protocol ___VARIABLE_productName:identifier___RouterDelegate: class { }

class ___VARIABLE_productName:identifier___Router: Router {
  weak var viewController: UIViewController?
  weak var delegate: ___VARIABLE_productName:identifier___RouterDelegate?
  
  static func createModule(delegate: ___VARIABLE_productName:identifier___RouterDelegate?) -> UIViewController {
    let view = ___VARIABLE_productName:identifier___ViewController(nibName: nil, bundle: nil)
    let interactor = ___VARIABLE_productName:identifier___Interactor()
    let router = ___VARIABLE_productName:identifier___Router()
    router.delegate = delegate
    router.viewController = view
    let presenter = ___VARIABLE_productName:identifier___Presenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    interactor.presenter = presenter
    return view
  }
}

// MARK: - ___VARIABLE_productName:identifier___RoutingLogic
extension ___VARIABLE_productName:identifier___Router: ___VARIABLE_productName:identifier___RoutingLogic { }
