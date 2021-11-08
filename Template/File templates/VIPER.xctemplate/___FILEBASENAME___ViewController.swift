//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import <#UI-framework#>

protocol ___VARIABLE_productName:identifier___DisplayLogic: AnyObject { }

class ___VARIABLE_productName:identifier___ViewController: UIContentViewController<___VARIABLE_productName:identifier___ContentView> {
  var presenter: ___VARIABLE_productName:identifier___PresentingLogic?

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupNavigationBar()
    presenter?.onViewLoaded()
  }
}

// MARK: - ___VARIABLE_productName:identifier___DisplayLogic
extension ___VARIABLE_productName:identifier___ViewController: ___VARIABLE_productName:identifier___DisplayLogic { }

private extension ___VARIABLE_productName:identifier___ViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() { }

  func setupNavigationBar() { }
}
