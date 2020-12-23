//
//  MoviesServices.swift
//  Movie Poster
//
//  Created by Дмитрий on 23.12.2020.
//

import Foundation


protocol MovieServiceProtocol {
    func fetchMovies(completion: @escaping (Result<MovieResponse, MovieError>) -> ())
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>)-> ())
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
}

enum MovieError: Error, CustomNSError {
    case apiError
    case invalidResponse
    case noData
    case serializationError
     
    var localizedDescription: String{
        switch  self {
        case .apiError: return "Не верный апи адрес"
        case .invalidResponse: return "Не верный ответ сервера"
        case .noData: return "Нет данных"
        case .serializationError: return "Ошибка сериализации"
        }
    }
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
    
}
