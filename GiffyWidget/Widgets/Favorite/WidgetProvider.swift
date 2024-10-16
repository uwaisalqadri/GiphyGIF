//
//  WidgetReducer.swift
//  GiffyWidget
//
//  Created by Uwais Alqadri on 8/10/23.
//

import WidgetKit
import SwiftUI
import Core
import Common

typealias FavoriteWidgetInteractor = Interactor<
  String, [Giffy], FavoriteGiphysRepository<
    FavoriteLocalDataSource
  >
>

struct WidgetProvider: IntentTimelineProvider {
  private let useCase: FavoriteWidgetInteractor

  init(useCase: FavoriteWidgetInteractor) {
    self.useCase = useCase
  }
  
  private var sampleEntry: GiphyEntry {
    return GiphyEntry(total: 10)
  }
  
  func placeholder(in context: Context) -> GiphyEntry {
    sampleEntry
  }
  
  func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (GiphyEntry) -> Void) {
    Task {
      let response = try await self.useCase.execute(request: "")
      completion(GiphyEntry(total: response.count))
    }
  }
  
  func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<GiphyEntry>) -> Void) {
    Task {
      let response = try await self.useCase.execute(request: "")
      let entries = [GiphyEntry(total: response.count)]
      let timeline = Timeline(entries: entries, policy: .atEnd)
      completion(timeline)
    }
  }
}
