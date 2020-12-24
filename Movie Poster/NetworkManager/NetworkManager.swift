//
//  NetworkManager.swift
//  Movie Poster
//
//  Created by Дмитрий on 25.12.2020.
//

import Foundation

protocol NetworkManagerProtocol {
    func getDeveloperData(completion: @escaping (_ developer: User, _ error : NSError ) -> ())
}

class NetworkManager: NetworkManagerProtocol {
    func getDeveloperData(completion: @escaping (User, NSError) -> ()) {
        
    }
    
    
}
