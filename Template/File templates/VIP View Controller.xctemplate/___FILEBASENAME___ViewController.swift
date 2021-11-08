//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

class ___VARIABLE_moduleName___ViewController: UIViewController {
  private let contentView = ___VARIABLE_moduleName___ContentView.autolayoutView()
  
  init() {
    super.init(nibName: nil, bundle: nil)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension ___VARIABLE_moduleName___ViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    contentView.snp.makeConstraints { $0.edges.equalTo(view.safeAreaLayoutGuide) }
  }
}
