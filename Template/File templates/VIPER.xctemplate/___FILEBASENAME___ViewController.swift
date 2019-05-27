//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_productName:identifier___DisplayLogic: class { }

class ___VARIABLE_productName:identifier___ViewController: UIViewController {
  var presenter: ___VARIABLE_productName:identifier___ViewPresentingLogic?
  private lazy var contentView = ___VARIABLE_productName:identifier___ContentView.autolayoutView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - ___VARIABLE_productName:identifier___DisplayLogic
extension ___VARIABLE_productName:identifier___ViewController: ___VARIABLE_productName:identifier___DisplayLogic { }

private extension ___VARIABLE_productName:identifier___ViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
  }
}
