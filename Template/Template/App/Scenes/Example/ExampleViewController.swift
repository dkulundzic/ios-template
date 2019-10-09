//
//  ExampleViewController.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//

import UIKit

protocol ExampleDisplayLogic: class {
  func displayTodos()
}

class ExampleViewController: UIViewController {
  var presenter: ExampleViewPresentingLogic?
  private let contentView = ExampleContentView.autolayoutView()
  
  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Example"
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
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
  
  func setupContentView() {
    view.addSubview(contentView)
    NSLayoutConstraint.activate([
      contentView.leftAnchor.constraint(equalTo: view.leftAnchor),
      contentView.topAnchor.constraint(equalTo: view.topAnchor),
      contentView.rightAnchor.constraint(equalTo: view.rightAnchor),
      contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}
