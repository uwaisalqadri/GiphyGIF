//
//  GiphyEntity.swift
//  
//
//  Created by Uwais Alqadri on 10/17/21.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapperAdditions

public class GiphyResponse: Mappable {
  public var data: [GiphyEntity]?

  required public init?(map: ObjectMapper.Map) {
    mapping(map: map)
  }

  public func mapping(map: ObjectMapper.Map) {
    data <- map["data"]
  }
}

public class GiphyEntity: Object, Mappable, Giphy {
  @objc dynamic public var type: String = ""
  @objc dynamic public var identifier: String = ""
  @objc dynamic public var url: String = ""
  @objc dynamic public var embedUrl: String = ""
  @objc dynamic public var rating: String = ""
  @objc dynamic public var username: String = ""
  @objc dynamic public var title: String = ""
  @objc dynamic public var trendingDateTime: String = ""
  @objc public var isFavorite: Bool = false

  @objc dynamic public var _images: ImageGIFEntity?
  public var images: ImageGIF? {
    _images
  }

  public override class func primaryKey() -> String? {
    "identifier"
  }

  public override init() {
    super.init()
  }

  public required init?(map: ObjectMapper.Map) {
    super.init()
    mapping(map: map)
  }


  public func mapping(map: ObjectMapper.Map) {
//    let isWriteRequired = realm != nil && realm?.isInWriteTransaction == false
//    isWriteRequired ? realm?.beginWrite() : ()

    type <- (map["type"], StringTransform())
    identifier <- (map["id"], StringTransform())
    url <- (map["url"], StringTransform())
    embedUrl <- (map["embed_url"], StringTransform())
    rating <- (map["rating"], StringTransform())
    username <- (map["username"], StringTransform())
    title <- (map["title"], StringTransform())
    trendingDateTime <- (map["trending_datetime"], StringTransform())
    _images <- map["images"]

//    isWriteRequired ? try? realm?.commitWrite() : ()
  }
}
