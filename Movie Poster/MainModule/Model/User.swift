//
//  User.swift
//  Movie Poster
//
//  Created by Дмитрий on 25.12.2020.
//

import Foundation

struct User {
    let name: String
    let html_url: String
    let company: String
    let location: String
    let blog: String
    
    init(name: String, html_url: String, company: String, location: String, blog: String) {
        self.name = name
        self.html_url = html_url
        self.company = company
        self.location = location
        self.blog = blog
    }
}
