//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template inspired by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

protocol Router: class {
  associatedtype RouterDelegate
  var delegate: RouterDelegate? { get set }
  static func createModule(delegate: RouterDelegate?) -> UIViewController
}

class ___VARIABLE_productName:identifier___Router: ___VARIABLE_productName:identifier___RoutingLogic {
  weak var viewController: UIViewController?
  weak var delegate: ___VARIABLE_productName:identifier___RouterDelegate?
  
  static func createModule(delegate: ___VARIABLE_productName:identifier___RouterDelegate?) -> UIViewController {
    let view = ___VARIABLE_productName:identifier___ViewController(nibName: nil, bundle: nil)
    let interactor = ___VARIABLE_productName:identifier___Interactor()
    let router = ___VARIABLE_productName:identifier___Router()
    router.delegate = delegate
    let presenter = ___VARIABLE_productName:identifier___Presenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    interactor.presenter = presenter
    router.viewController = view
    return view
  }
}
