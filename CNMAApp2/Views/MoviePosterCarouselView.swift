//
//  MoviePosterCarouselView.swift
//  CNMAApp2
//
//  Created by Иван Непорадный on 31.07.2024.
//

import SwiftUI

struct MoviePosterCarouselView: View {
    
    let title: String
    let movies: [Movie]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        MoviePosterCard(movie: movie)
                            .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                            .padding(.trailing, movie.id == self.movies.first!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

#Preview {
    MoviePosterCarouselView(title: "Now Playing", movies: Movie.stubbedMovies)
}
