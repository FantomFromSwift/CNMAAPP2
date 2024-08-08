//
//  MovieListView.swift
//  CNMAApp2
//
//  Created by Иван Непорадный on 31.07.2024.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var nowPlayingState = MoviesListState()
    @ObservedObject private var upcomingState = MoviesListState()
    @ObservedObject private var topRatedState = MoviesListState()
    @ObservedObject private var popularState = MoviesListState()

    @State private var isProfileViewPresented = false
    @State private var isAuthViewPresented = true

    var body: some View {
        NavigationStack {
            List {
                Group {
                    if nowPlayingState.movies != nil {
                        MoviePosterCarouselView(title: "Now Playing", movies: nowPlayingState.movies!)
                    } else {
                        LoadingView(isLoading: nowPlayingState.isLoading, error: nowPlayingState.error) {
                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))

                Group {
                    if upcomingState.movies != nil {
                        MovieBackdropCarouselView(title: "Upcoming", movies: upcomingState.movies!)
                    } else {
                        LoadingView(isLoading: upcomingState.isLoading, error: upcomingState.error) {
                            self.upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))

                Group {
                    if topRatedState.movies != nil {
                        MoviePosterCarouselView(title: "Top Rated", movies: topRatedState.movies!)
                    } else {
                        LoadingView(isLoading: topRatedState.isLoading, error: topRatedState.error) {
                            self.topRatedState.loadMovies(with: .topRated)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))

                Group {
                    if popularState.movies != nil {
                        MoviePosterCarouselView(title: "Popular", movies: popularState.movies!)
                    } else {
                        LoadingView(isLoading: popularState.isLoading, error: popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
            }
            .navigationTitle("The MovieDb")
                        
                       
                        
                    }
                    .onAppear {
                        self.nowPlayingState.loadMovies(with: .nowPlaying)
                        self.upcomingState.loadMovies(with: .upcoming)
                        self.topRatedState.loadMovies(with: .topRated)
                        self.popularState.loadMovies(with: .popular)
                    }
                }
            }
#Preview {
    ContentView()
}
