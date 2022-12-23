//
//  MementoStateSaver.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 23.12.2022.
//

import Foundation

class MementoStateSaver {
    
    private let decoder = PropertyListDecoder()
    private let encoder = PropertyListEncoder()
    private let userDefaults = UserDefaults.standard
    
    public func save(_ movieData: [MovieModel], title: String) throws {
        if let data = try? encoder.encode(movieData) {
            userDefaults.set(data, forKey: title)
        }
    }
    public func load(_ title: String) throws -> [MovieModel] {
        if let data = userDefaults.value(forKey: title) as? Data {
            do {
                return try decoder.decode([MovieModel].self, from: data)
            } catch let error {
                print(error.localizedDescription)
                throw Error.movieDataNotFound
            }
        }
        return []
    }
    public enum Error: String, Swift.Error {
        case movieDataNotFound
    }
}
