//
//  ExampleNavigationViewController.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//

import UIKit
import TemplateUI

protocol ExampleNavigationDisplayLogic: AnyObject { }

class ExampleNavigationViewController: UIContentViewController<ExampleNavigationContentView> {
  var presenter: ExampleNavigationPresentingLogic?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupNavigationBar()
    presenter?.viewLoaded()
  }
  
  deinit {
    print(#function + ": \(type(of: self))")
  }
}

// MARK: - ExampleNavigationDisplayLogic
extension ExampleNavigationViewController: ExampleNavigationDisplayLogic { }

private extension ExampleNavigationViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() { }

  func setupNavigationBar() {
    navigationItem.title = "Example navigation"
  }
}
