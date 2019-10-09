//
//  PropertyWrappers.swift
//  Template
//
//  Created by Domagoj Kulundzic on 02/10/2019.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
  public let key: String
  public let defaultValue: T
  
  public init(_ key: String, defaultValue: T) {
    self.key = key
    self.defaultValue = defaultValue
  }
  
  public var wrappedValue: T {
    get { return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
    set { UserDefaults.standard.set(newValue, forKey: key) }
  }
}

@propertyWrapper
public struct Atomic<T> {
  private var value: T
  private let lock = NSLock()
  
  public init(wrappedValue value: T) {
    self.value = value
  }
  
  public var wrappedValue: T {
    get { return load() }
    set { store(newValue: newValue) }
  }
  
  public func load() -> T {
    lock.lock()
    defer { lock.unlock() }
    return value
  }
  
  public mutating func store(newValue: T) {
    lock.lock()
    defer { lock.unlock() }
    value = newValue
  }
}
