//
//  MovieStore.swift
//  Movie Poster
//
//  Created by Дмитрий on 23.12.2020.
//

import Foundation


class MovieStore: MovieServiceProtocol {
    
    static let shared = MovieStore()
    private init() {}
    
    private let apiKey = ""
    private let baseUrl = ""
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utils.jsonDecoder
    
    
    func fetchMovies(completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
        guard let url = URL(string: "\(baseUrl)/movie") else {
            completion(.failure(.invalidResponse) )
            return
        }
        self.loadURLAndDecode(url: url, completion: completion)
    }
    
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ()) {
        guard let url = URL(string: "\(baseUrl)/movie/\(id)") else {
            completion(.failure(.invalidResponse) )
            return
        }
        self.loadURLAndDecode(url: url, completion: completion)
    }
    
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
        guard let url = URL(string: "\(baseUrl)/search/movie") else {
            completion(.failure(.invalidResponse) )
            return
        }
        self.loadURLAndDecode(url: url, params: [
            "language" : "ru-Ru",
            "include_adult" : "false",
            "query" : query
        ], completion: completion)
    }
    
    private func loadURLAndDecode<D: Decodable>(url: URL, params: [String: String]? = nil, completion: @escaping (Result<D, MovieError>) -> ()){
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.apiError))
            return
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        if let params = params{
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        urlComponents.queryItems = queryItems
        guard let finalUrl = urlComponents.url else {
            completion(.failure(.apiError))
            return
        }
        
        urlSession.dataTask(with: finalUrl) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if error != nil{
                self.executeCompletionHandlerMainThread(with: .failure(.apiError), completion: completion)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeCompletionHandlerMainThread(with: .failure(.apiError), completion:  completion)
                return
            }
            guard let data = data else {
                self.executeCompletionHandlerMainThread(with: .failure(.noData), completion: completion)
                return
            }
            
            do{
                let decodedResponse = try self.jsonDecoder.decode(D.self, from: data)
                self.executeCompletionHandlerMainThread(with: .success(decodedResponse), completion: completion)
            } catch {
                self.executeCompletionHandlerMainThread(with: .failure(.serializationError), completion: completion)
            }
        }.resume()
    }
    
    private func executeCompletionHandlerMainThread<D: Decodable>(with result: Result<D, MovieError>, completion: @escaping (Result<D, MovieError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
    
}
