//
//  Utils.swift
//  Movie Poster
//
//  Created by Дмитрий on 23.12.2020.
//

import Foundation


class Utils {
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
}
