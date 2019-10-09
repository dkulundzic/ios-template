//
//  ExampleNavigationContentView.swift
//  Template
//
//  Created Domagoj Kulundzic on 27/05/2019.
//

import UIKit

class ExampleNavigationContentView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension ExampleNavigationContentView {
  func setupViews() {
    backgroundColor = .green
  }
}
