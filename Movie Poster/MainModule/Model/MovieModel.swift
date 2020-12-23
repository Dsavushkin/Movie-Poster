//
//  MovieModel.swift
//  Movie Poster
//
//  Created by Дмитрий on 23.12.2020.
//

import Foundation

struct MovieResponse: Decodable{
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPat: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
}

//struct ResultMovies: Codable {
//    let adult: Bool
//    let backdropPath: String
//    let genreIDS: [Int]
//    let id: Int
//    let originalLanguage: [String]
//    let originalTitle, overview: String
//    let popularity: Double
//    let posterPath, releaseDate, title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case genreIDS = "genre_ids"
//        case id
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview, popularity
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
