//
//  ExampleContentView.swift
//  Template
//
//  Created by Domagoj Kulundzic on 27/05/2019.
//  Copyright © 2019 Martian & Machine. All rights reserved.
//

import UIKit

class ExampleContentView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension ExampleContentView {
  func setupViews() {
    backgroundColor = .white
  }
}
