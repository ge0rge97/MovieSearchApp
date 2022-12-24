//
//  NetworkingServices.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 19.12.2022.
//

import Foundation

//https://api.themoviedb.org/3/movie/upcoming?api_key=7356cf7274566fcc26e46b37a260f2c6

//https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>

//https://api.themoviedb.org/3/movie/top_rated?api_key=7356cf7274566fcc26e46b37a260f2c6
//https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>


//https://api.themoviedb.org/3/search/movie?api_key=7356cf7274566fcc26e46b37a260f2c6&query=STRING

enum PathMovieCategory: String {
    case upcoming = "upcoming"
    case trending = "popular"
}

class NetworkingServices {
    
    //MARK: - Networking Movie
    func getMovieRequest(withPath path: PathMovieCategory, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = self.prepareMovieParameters()
        let url = self.getMovieApiUrl(withParameters: parameters, andPath: path)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = self.createDataTask(fromRequest: request,
                                       completion: completion)
        task.resume()
    }
    private func getMovieApiUrl(withParameters parameters: [String: String], andPath path: PathMovieCategory)-> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/movie/\(path.rawValue)"
        components.queryItems = parameters.map { URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    private func prepareMovieParameters()-> [String: String] {
        var parameters = [String: String]()
        parameters["language"] = "en-US"
        parameters["api_key"] = "7356cf7274566fcc26e46b37a260f2c6"
        return parameters
    }
    
    //MARK: - Networking Search Movie
    
    //https://api.themoviedb.org/3/search/movie?api_key=7356cf7274566fcc26e46b37a260f2c6&query=STRING
    
    //https://api.themoviedb.org/3/movie/top_rated?api_key=7356cf7274566fcc26e46b37a260f2c6
    
    
    func getSearchMovieRequest(withSearchTerm searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = self.prepareSearchMovieParameters(withSearchTerm: searchTerm)
        let url = self.getSearchMovieApiUrl(withParameters: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = self.createDataTask(fromRequest: request,
                                       completion: completion)
        task.resume()
    }
    private func getSearchMovieApiUrl(withParameters parameters: [String: String])-> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/search/movie"
        components.queryItems = parameters.map { URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    private func prepareSearchMovieParameters(withSearchTerm searchTerm: String)-> [String: String] {
        var parameters = [String: String]()
        parameters["api_key"] = "7356cf7274566fcc26e46b37a260f2c6"
        parameters["query"] = searchTerm
        return parameters
    }
}
//MARK: - Create DataTask
extension NetworkingServices {
    
    private func createDataTask(fromRequest request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
