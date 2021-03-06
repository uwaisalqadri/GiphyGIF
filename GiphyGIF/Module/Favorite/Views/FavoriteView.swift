//
//  FavoriteView.swift
//  GiphyGIF
//
//  Created by Uwais Alqadri on 26/05/21.
//

import SwiftUI
import Lottie
import Core
import Giphy
import Common

typealias FavoritePresenter = GetListPresenter<
  String, Giphy, Interactor<
    String, [Giphy], FavoriteGiphysRepository<
      GiphyLocalDataSource
    >
  >
>

struct FavoriteView: View {

  @ObservedObject var presenter: FavoritePresenter
  @ObservedObject var removeFavoritePresenter: RemoveFavoritePresenter

  var body: some View {
    ScrollView {

      SearchInput { query in
        presenter.getList(request: query)
      }.padding(.top, 30)

      if !presenter.list.isEmpty {
        LazyVStack {
          ForEach(Array(presenter.list.enumerated()), id: \.offset) { _, item in
            SearchRow(isFavorite: true, giphy: item, router: Injection.shared.resolve()) { giphy in
              removeFavoritePresenter.execute(request: giphy)
              presenter.getList(request: "")
            }.padding(.vertical, 20)
            .padding(.horizontal, 20)
          }
        }
      } else {
        isFavoriteEmpty.padding(.top, 50)
      }

    }.navigationTitle("favorite".localized())
    .onAppear {
      presenter.getList(request: "")
    }
    .onDisappear {
      presenter.getList(request: "")
    }
  }

  var isFavoriteEmpty: some View {
    VStack {
      LottieView(fileName: "add_to_favorite", bundle: Common.loadBundle(), loopMode: .loop)
        .frame(width: 220, height: 220)
      Text("favorite_empty".localized())
    }
  }

}

struct FavoriteView_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteView(presenter: Injection.shared.resolve(), removeFavoritePresenter: Injection.shared.resolve())
  }
}
