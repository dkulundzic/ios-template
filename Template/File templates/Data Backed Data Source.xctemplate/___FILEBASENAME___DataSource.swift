//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

enum ___VARIABLE_dataSourceName___Item {
  case <#item#>
}

enum ___VARIABLE_dataSourceName___Section: SectionProtocol {
  case <#section#>([___VARIABLE_dataSourceName___Item])
  
  var items: [___VARIABLE_dataSourceName___Item] {
    switch self {
    case .<#section#>(let items):
      return items
    }
  }
}

class ___VARIABLE_dataSourceName___: DataBackedDataSourceProtocol {
  private(set) var data = [<#data-type#>]()
  private(set) lazy var sections = [___VARIABLE_dataSourceName___Section]()
  
  init() {
    buildSections()
  }
}

private extension ___VARIABLE_dataSourceName___ {
  func buildSections() { }
}
