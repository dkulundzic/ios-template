//
//  TaskThrottler.swift
//  Template
//
//  Created by Domagoj Kulundzic on 04/10/2018.
//  Copyright © 2018 Martian & Machine. All rights reserved.
//

import Foundation

/// A type that's used to throttle/delay task execution by a certain time interval.
/// - note: An example **TaskThrottler** usage is performing an network request for validating
///		a username, where the request shouldn't be fired for each character the user types in, but
///		rather after the user stops typing for a short interval.
public class TaskThrottler {
  public var delay: TimeInterval
  private let queue: DispatchQueue
  private var job: DispatchWorkItem?
  
  /// Initialises a new **TaskThrottler** instance.
  /// - parameter queue: The **DispatchQueue** on which the throttler will execute it's tasks. Defaults to **.main**.
  /// - parameter delay: The **TimeInterval** that the throttler will use to delay task execution. Defaults to **0.5**.
  public init(queue: DispatchQueue = .main, delay: TimeInterval = 0.5) {
    self.queue = queue
    self.delay = delay
  }
}

public extension TaskThrottler {
  var isExecuting: Bool {
    return job != nil
  }
  
  /// Schedules task execution, while applying any required throttling.
  /// - parameter work: A closure defining a task to be executed.
  func execute(work: @escaping () -> Void) {
    job?.cancel()
    let newJob = DispatchWorkItem { [weak self] in
      work()
      self?.job = nil
    }
    job = newJob
    queue.asyncAfter(deadline: .now() + delay, execute: newJob)
  }
  
  /// Cancels a scheduled task, if it exists.
  func cancelPendingJob() {
    job?.cancel()
  }
}
