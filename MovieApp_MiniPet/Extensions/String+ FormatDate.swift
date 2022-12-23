//
//  String+ FormatDate.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 23.12.2022.
//

import Foundation

extension String {
    
    static func convertDateFormat(sourceDateString: String) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        if let date = dateFormatter.date(from: sourceDateString) {
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
}
