//
//  GiphyEntity.swift
//  
//
//  Created by Uwais Alqadri on 10/17/21.
//

import Foundation

public class GiphyDataResponse: Codable {
  public var data = [GiphyResponse]()

  public enum CodingKeys: String, CodingKey {
    case data
  }
}

public class GiphyResponse: Codable {
  public var type: String?
  public var id: String?
  public var url: String?
  public var embedUrl: String?
  public var rating: String?
  public var username: String?
  public var title: String?
  public var trendingDateTime: String?
  public var images: ImageGIFResponse?
  
  public enum CodingKeys: String, CodingKey {
    case type
    case id
    case url
    case embedUrl = "embed_url"
    case rating
    case username
    case title
    case trendingDateTime = "trending_datetime"
    case images
  }
}
