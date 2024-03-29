//
//  File.swift
//  
//
//  Created by Uwais Alqadri on 10/17/21.
//

import Core
import Combine

public struct SearchGiphyRepository<
  GiphyDataSource: DataSource>: Repository
where
  GiphyDataSource.Response == [Giphy],
  GiphyDataSource.Request == String {

  public typealias Request = String
  public typealias Response = [Giphy]

  private let remoteDataSource: GiphyDataSource

  public init(remoteDataSource: GiphyDataSource) {
    self.remoteDataSource = remoteDataSource
  }

  public func execute(request: String?) async throws -> [Giphy] {
    return try await remoteDataSource.execute(request: request)
  }
}
