//
//  ExampleViewController.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//  Copyright © 2019 Martian & Machine. All rights reserved.
//

import UIKit

protocol ExampleDisplayLogic: class {
  func displayTodos()
}

class ExampleViewController: UIViewController {
  var presenter: ExampleViewPresentingLogic?
  private let contentView = ExampleContentView.autolayoutView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    presenter?.viewLoaded()
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
  
  func setupContentView() {
    view.addSubview(contentView)
  }
}
