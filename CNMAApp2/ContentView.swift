//
//  ContentView.swift
//  CNMAApp2
//
//  Created by Иван Непорадный on 27.07.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = true
    

    var body: some View {
        if isAppLockEnabled {
            TabViewComponent()
            } else {
            AuthView()
        }
    }
    @ViewBuilder
    func TabViewComponent() -> some View{
        SwiftUI.TabView(selection: .constant(1),
                content:  {
            MovieListView().tabItem {
                Image(systemName: "tv")
                Text("Список фільмів") }
            ProfileView().tabItem {
                Image(systemName: "person")
                Text("Особові данні") }
            MovieSearchView().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Пошук")
            } 
        })
    }
}

#Preview {
    ContentView()
}
