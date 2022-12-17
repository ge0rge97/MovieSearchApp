//
//  UpcomingMovieCollectionViewCell.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit

final class UpcomingMovieCollectionViewCell: BaseCollectionViewMovieCell {
    
    static let reuseId: String = "upcomingMovieCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        movieCellImage.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
