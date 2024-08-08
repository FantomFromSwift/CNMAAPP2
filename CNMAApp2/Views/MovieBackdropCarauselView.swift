//
//  MovieBackdropCarauselView.swift
//  CNMAApp2
//
//  Created by Иван Непорадный on 31.07.2024.
//

import SwiftUI

struct MovieBackdropCarauselView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        
                        MovieBackdropCard(movie: movie)
                            .frame(width: 272, height: 200)
                            .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                            .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

#Preview {
    MovieBackdropCarauselView(title: "Latest", movies: Movie.stubbedMovies)
}
