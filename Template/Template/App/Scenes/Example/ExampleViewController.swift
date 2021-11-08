//
//  ExampleViewController.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//

import UIKit
import TemplateUI

protocol ExampleDisplayLogic: AnyObject {
  func displayTodos()
}

class ExampleViewController: UIContentViewController<ExampleContentView> {
  var presenter: ExamplePresentingLogic?

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupNavigationBar()
    presenter?.viewLoaded()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    presenter?.viewAppeared()
  }
  
  deinit {
    print(#function + ": \(type(of: self))")
  }
}

// MARK: - ExampleDisplayLogic
extension ExampleViewController: ExampleDisplayLogic {
  func displayTodos() {
    print(#function)
  }
}

private extension ExampleViewController {
  func setupView() {
    setupContentView()
  }

  func setupContentView() { }

  func setupNavigationBar() {
    navigationItem.title = "Example"
  }
}
