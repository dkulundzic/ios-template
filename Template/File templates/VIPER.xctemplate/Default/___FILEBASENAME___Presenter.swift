//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template inspired by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___PresentingLogic {
  var interactor: ___VARIABLE_productName:identifier___BusinessLogic?
  weak private var view: ___VARIABLE_productName:identifier___DisplayLogic?
  private let router: ___VARIABLE_productName:identifier___RoutingLogic
  
  init(interface: ___VARIABLE_productName:identifier___DisplayLogic, interactor: ___VARIABLE_productName:identifier___BusinessLogic?, router: ___VARIABLE_productName:identifier___RoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}
