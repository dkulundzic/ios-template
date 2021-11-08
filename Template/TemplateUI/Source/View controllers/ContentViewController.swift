//
//  ContentViewController.swift
//  System
//
//  Created by Domagoj Kulundzic on 08/11/2021.
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

open class UIContentViewController<ContentView: UIView>: UIViewController {
  public private(set) lazy var contentView = ContentView()

  open override func loadView() {
    view = contentView
  }
}

open class UIContentTabBarController<ContentView: UIView>: UITabBarController {
  public private(set) lazy var contentView = ContentView()

  open override func loadView() {
    view = contentView
  }
}

open class UIContentPageViewController<ContentView: UIView>: UIPageViewController {
  public private(set) lazy var contentView = ContentView()

  open override func loadView() {
    view = contentView
  }
}

open class ContentViewController<ContentView: UIView>: ViewController {
  public private(set) lazy var contentView = ContentView()

  open override func loadView() {
    view = contentView
  }
}
