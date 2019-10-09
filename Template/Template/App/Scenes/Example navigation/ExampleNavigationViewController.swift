//
//  ExampleNavigationViewController.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//

import UIKit

protocol ExampleNavigationDisplayLogic: class { }

class ExampleNavigationViewController: UIViewController {
  var presenter: ExampleNavigationViewPresentingLogic?
  private lazy var contentView = ExampleNavigationContentView.autolayoutView()
  
  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Example navigation"
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
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
