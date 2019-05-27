//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

protocol ___VARIABLE_moduleName___DisplayLogic: class { }

class ___VARIABLE_moduleName___ViewController: /* INSERT BASE VIEW CONTROLLER CLASS */ {
  var interactor: ___VARIABLE_moduleName___BusinessLogic?
  var router: ___VARIABLE_moduleName___RoutingLogic?
  private lazy var contentView = ___VARIABLE_moduleName___ContentView.autolayoutView()
  
  init(delegate: ___VARIABLE_moduleName___RouterDelegate?) {
    super.init(nibName: nil, bundle: nil)
    let interactor = ___VARIABLE_moduleName___Interactor()
    let presenter = ___VARIABLE_moduleName___Presenter()
    let router = ___VARIABLE_moduleName___Router()
    interactor.presenter = presenter
    presenter.viewController = self
    router.viewController = self
    router.delegate = delegate
    self.interactor = interactor
    self.router = router
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    // call update constraints method
  }
}

// MARK: - Display Logic
extension ___VARIABLE_moduleName___ViewController: ___VARIABLE_moduleName___DisplayLogic { }

// MARK: - Private Methods
private extension ___VARIABLE_moduleName___ViewController {
  func setupViews() {
    // setup title, background, navigation buttons, etc
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    // add constraints
  }
}
