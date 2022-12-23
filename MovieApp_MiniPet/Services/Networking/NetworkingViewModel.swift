//
//  NetworkingViewModel.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 20.12.2022.
//

import Foundation

class NetworkingViewModel {
    
    var networkServices = NetworkingServices()
    
    func fetchMovieData(withPath path: PathMovieCategory, completion: @escaping ([Result]?) -> Void) {
        
        networkServices.getMovieRequest(withPath: path) { data, error in
            if let error = error {
                print("There are some requesting data error:", error.localizedDescription)
                completion(nil)
            }
            let decode = self.decodeJSON(withType: MovieNetworkingDataModel.self, fromData: data)
            completion(decode?.results)
        }
    }
}
//MARK: - Decode JSON
extension NetworkingViewModel {
    
    private func decodeJSON<T: Decodable>(withType type: T.Type, fromData data: Data?) -> T? {
        
        let decoder = JSONDecoder()
        guard let data = data else {
            return nil
        }
        do {
            let items = try decoder.decode(type, from: data)
            return items
        } catch let decodingError {
            
            print("Ooops, something went wrong with decoding data:", decodingError)
            return nil
        }
    }
}
