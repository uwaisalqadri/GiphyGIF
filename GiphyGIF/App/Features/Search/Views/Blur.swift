//
//  Blur.swift
//  GiphyGIF
//
//  Created by Uwais Alqadri on 25/05/21.
//

import Foundation
import SwiftUI

struct Blur: UIViewRepresentable {
  @State var style: UIBlurEffect.Style = .systemMaterial

  func makeUIView(context: Context) -> UIVisualEffectView {
    return UIVisualEffectView(effect: UIBlurEffect(style: style))
  }

  func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
    uiView.effect = UIBlurEffect(style: style)
  }
}
