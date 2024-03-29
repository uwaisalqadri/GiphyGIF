//
//  Giphy.swift
//  
//
//  Created by Uwais Alqadri on 10/17/21.
//

import Foundation

public struct Giphy: Equatable, Hashable {
  public static func == (lhs: Giphy, rhs: Giphy) -> Bool {
    lhs.id == rhs.id
  }
  
  public func hash(into hasher: inout Hasher) {
    return hasher.combine(id)
  }
  
  public var type: String
  public var id: String
  public var url: String
  public var embedUrl: String
  public var rating: String
  public var username: String
  public var title: String
  public var trendingDateTime: String
  public var image: ImageOriginal
  public var isFavorite: Bool
  
  public init(type: String = "", id: String = "", url: String = "", embedUrl: String = "", rating: String = "", username: String = "", title: String = "", trendingDateTime: String = "", image: ImageOriginal = .init(), isFavorite: Bool = false) {
    self.type = type
    self.id = id
    self.url = url
    self.embedUrl = embedUrl
    self.rating = rating
    self.username = username
    self.title = title
    self.trendingDateTime = trendingDateTime
    self.image = image
    self.isFavorite = isFavorite
  }
  
  public func setFavorite(_ state: Bool) -> Giphy {
    return Giphy(type: type, id: id, url: url, embedUrl: embedUrl, rating: rating, username: username, title: title, trendingDateTime: trendingDateTime, image: image, isFavorite: state)
  }
}

public struct ImageOriginal {
  public var url: String
  public var height: String
  public var width: String
  
  public init(url: String = "", height: String = "", width: String = "") {
    self.url = url
    self.height = height
    self.width = width
  }
}
