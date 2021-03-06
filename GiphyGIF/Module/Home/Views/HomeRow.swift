//
//  HomeRow.swift
//  GiphyGIF
//
//  Created by Uwais Alqadri on 24/05/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Core
import Giphy
import Common

struct HomeRow: View {

  @State var isAnimating = true
  @State var showDetail = false
  let giphy: Giphy
  let router: DetailRouter

  var body: some View {
    VStack(alignment: .leading) {

      AnimatedImage(url: URL(string: giphy.images.original.url), isAnimating: $isAnimating)
        .placeholder(content: {
          Color(Common.loadRandomColor())
        })
        .resizable()
        .frame(
          idealWidth: (giphy.images.original.width).cgFloatValue(),
          idealHeight: (giphy.images.original.height).cgFloatValue(),
          alignment: .center
        )
        .scaledToFit()
        .cornerRadius(20)
        .padding(.top, 10)
        .sheet(isPresented: $showDetail) {
          router.routeDetail(giphy: giphy, isFavorite: false)
        }
        .onTapGesture {
          showDetail.toggle()
        }
    }
  }
}
