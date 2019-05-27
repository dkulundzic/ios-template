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

class ___VARIABLE_productName:identifier___ViewController: UIViewController {
  var presenter: ___VARIABLE_productName:identifier___PresentingLogic?
  private let contentView = ___VARIABLE_productName:identifier___ContentView.autolayoutView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

extension ___VARIABLE_productName:identifier___ViewController: ___VARIABLE_productName:identifier___DisplayLogic { }

private extension ___VARIABLE_productName:identifier___ViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
  }
}
