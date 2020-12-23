//
//  MovieStore.swift
//  Movie Poster
//
//  Created by Дмитрий on 23.12.2020.
//

import Foundation


class MovieStore: MovieServiceProtocol {
    func fetchMovies(completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
        <#code#>
    }
    
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ()) {
        <#code#>
    }
    
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
        <#code#>
    }
    
}
