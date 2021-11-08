//
//  DataBackedDataSourceProtocol.swift
//  System
//
//  Created by Domagoj Kulundzic on 08.11.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation

public protocol DataBackedDataSourceProtocol: DataSourceProtocol {
  associatedtype Data: Collection
  var data: Data { get }
  func element(at indexPath: IndexPath) -> Data.Element?
  func element(where: @escaping (Data.Element) -> Bool) -> Data.Element?
}

public extension DataBackedDataSourceProtocol where Data.Index == Int {
  func element(at indexPath: IndexPath) -> Data.Element? {
    data[safe: indexPath.item]
  }

  func element(where: @escaping (Data.Element) -> Bool) -> Data.Element? {
    data.first(where: `where`)
  }
}

public extension DataBackedDataSourceProtocol where Data.Index == Int, Data.Element: Equatable {
  /// Retrieves the related index path of a data element within a data source, if the element exists in the data source.
  /// - Parameter element: The element for which the index path is requested.
  /// - Returns: Returns a index path describing the element's position or nil if the element cannot be found within the data source.
  func indexPath(for element: Data.Element) -> IndexPath? {
    guard let indexOf = data.firstIndex(of: element) else {
      return nil
    }
    return IndexPath(item: indexOf, section: 0)
  }
}
