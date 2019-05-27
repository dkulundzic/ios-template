//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template inspired by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: - Router
protocol ___VARIABLE_productName:identifier___RoutingLogic: class { }

//MARK: - Router delegate
protocol ___VARIABLE_productName:identifier___RouterDelegate: class { }

//MARK: - Presenter
protocol ___VARIABLE_productName:identifier___PresentingLogic: class { }

//MARK: - Interactor
protocol ___VARIABLE_productName:identifier___BusinessLogic: class {
  var presenter: ___VARIABLE_productName:identifier___PresentingLogic?  { get set }
}

//MARK: - View
protocol ___VARIABLE_productName:identifier___DisplayLogic: class {
  var presenter: ___VARIABLE_productName:identifier___PresentingLogic?  { get set }
}
