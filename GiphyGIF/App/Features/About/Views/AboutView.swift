//
//  AboutView.swift
//  GiphyGIF
//
//  Created by Uwais Alqadri on 29/05/21.
//

import SwiftUI

struct AboutView: View {
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading) {
          HStack {
            Image("tampandanberani")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 80, height: 80)
              .cornerRadius(20)

            VStack(alignment: .leading) {
              Text("Uwais Alqadri")
                .font(.system(size: 24))
                .bold()

              SocialMediaItemView(image: "apple", name: "iOS Developer")
            }
            .padding(.leading)

            Spacer()
          }
          .padding(24)

          VStack(alignment: .leading) {
            SocialMediaItemView(image: "instagram", name: "@uwais.__alqadri")
            SocialMediaItemView(image: "gmail", name: "uwaisalqadri654321@gmail.com")
            SocialMediaItemView(image: "linkedin", name: "Uwais Alqadri")
            Divider()
              .padding(.top, 16)
          }
          .padding([.leading, .trailing], 24)

          VStack(alignment: .leading) {
            Text("About Me")
              .font(.system(size: 18, weight: .medium, design: .rounded))
              .bold()

            Text("High school student majoring in Software Engineering, learn code from school, but more from the Internet and very passionate about Mobile Development in Native-way. originally from Makassar and currently live in Jakarta. started code in 15 y.o, and specialize in Android Kotlin and IOS Swift.")
              .padding(.top, 16)
          }
          .padding([.leading, .trailing], 24)

          Spacer()
        }
      }
      .padding(.bottom, 100)
      .navigationTitle("Profile")
    }
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
