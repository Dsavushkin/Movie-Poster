//
//  MovieListState.swift
//  Movie Poster
//
//  Created by Дмитрий on 24.12.2020.
//

import Foundation


class MovieListState: ObservableObject {
    
    static let shared = MovieListState()

    @Published var movies: [Movie]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    private let movieService: MovieStore
    
    init(movieService: MovieStore = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func loadMovie(){
        self.movies = nil
        self.isLoading = false
        self.movieService.fetchMovies(){ [weak self] (result) in
            self?.isLoading = false
            
            switch result{
            case .success(let response):
            self?.movies = response.results
            case .failure(let error):
                self?.error = error as NSError
            }
        }
    }
    
}
