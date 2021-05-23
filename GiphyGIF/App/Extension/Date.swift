//
//  Date.swift
//  GiphyGIF
//
//  Created by Uwais Alqadri on 23/05/21.
//

import Foundation

extension Date {
  func dateToString() -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMMM hh:mm"
    let stringDate = dateFormatter.string(from: self)
    return stringDate
  }

  func string(format: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }

  func dateOnly() -> Date {
    let comps = Calendar.current.dateComponents([.day, .month, .year], from: self)
    return Calendar.current.date(from: comps) ?? self
  }
}
