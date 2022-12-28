//
//  String+ removeSpace.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 27.12.2022.
//

import Foundation

extension String {
    
    private func replace(string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "+")
    }
}
