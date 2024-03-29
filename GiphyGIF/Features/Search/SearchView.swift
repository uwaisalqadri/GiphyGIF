//
//  SearchView.swift
//  GiphyGIF
//
//  Created by Uwais Alqadri on 24/05/21.
//

import SwiftUI
import Lottie
import Core
import Giphy
import Common
import ComposableArchitecture

struct SearchView: View {
  let store: StoreOf<SearchReducer>
  
  @State private var searchText = ""
  
  var body: some View {
    WithViewStore(store, observe: { $0 }) { viewStore in
      ScrollView(.vertical, showsIndicators: false) {
        SearchField { query in
          searchText = query
          viewStore.send(.fetch(request: searchText))
        }
        
        if !viewStore.state.isLoading {
          if viewStore.state.grid.rightGrid.isEmpty {
            SearchEmptyView()
              .padding(.top, 30)
          }
          
          HStack(alignment: .top) {
            LazyVStack(spacing: 8) {
              ForEach(viewStore.state.grid.rightGrid.indexed, id: \.position) { _, item in
                GiphyGridRow(giphy: item) { selectedItem in
                  viewStore.send(.showDetail(item: selectedItem))
                }
                .padding(.horizontal, 5)
              }
            }
            
            LazyVStack(spacing: 8) {
              ForEach(viewStore.state.grid.leftGrid.indexed, id: \.position) { _, item in
                GiphyGridRow(giphy: item) { selectedItem in
                  viewStore.send(.showDetail(item: selectedItem))
                }
                .padding(.horizontal, 5)
              }
            }
          }.padding(.horizontal, 10)
          
        } else {
          NyanCatLoading()
            .frame(maxWidth: .infinity)
            .padding(.top, 60)
        }
      }
      .navigationTitle(SearchString.titleSearch.localized)
      .navigationViewStyle(.stack)
      .navigationBarItems(
        trailing: Button(action: {
          viewStore.send(.openFavorite)
        }) {
          Image(systemName: "heart.fill")
            .resizable()
            .foregroundColor(.Theme.red)
            .frame(width: 20, height: 18)
        }
      )
      .padding(.top, 10)
      .onAppear {
        viewStore.send(.fetch(request: searchText.isEmpty ? "Hello" : searchText))
      }
    }
  }
}

struct SearchField: View {
  
  @State private var query = ""
  var onQueryChange: ((String) -> Void)?
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        TextField("", text: $query, prompt: Text(SearchString.labelSearchDesc.localized).foregroundColor(.gray))
          .font(.HelveticaNeue.s1SubtitleSemibold)
          .tint(.gray)
          .foregroundColor(.black)
          .frame(height: UIDevice.isIpad ? 60 : 40)
          .autocapitalization(.none)
          .disableAutocorrection(true)
          .padding(.leading, 13)
          .padding(.trailing, 30)
          .onChange(of: query) { text in
            onQueryChange?(text)
          }
        
        Button(action: {
          onQueryChange?(query)
        }) {
          Image(systemName: "magnifyingglass")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 20, height: 20)
            .background(
              LinearGradient(gradient: Gradient(colors: [.Theme.red, .Theme.purple]), startPoint: .bottomTrailing, endPoint: .topLeading)
                .frame(width: 40, height: 40)
                .cornerRadius(5, corners: [.topRight, .bottomRight])
            )
            .padding(.trailing, 10)
        }
      }
      .background(Color.white)
      .cornerRadius(5)
      .padding(.horizontal, 18)
    }
  }
}

struct SearchEmptyView: View {
  var body: some View {
    VStack {
      LottieView(fileName: "search_empty", bundle: Bundle.common, loopMode: .loop)
        .frame(width: 200, height: 200)
        .padding(.bottom, 5)
      
      Text(SearchString.labelSearching.localized)
        .font(.HelveticaNeue.s1SubtitleSemibold)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 40)
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView(store: Injection.shared.resolve())
  }
}
