//
//  UpcomingMovieCollectionViewCell.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 17.12.2022.
//

import UIKit
import SDWebImage

final class UpcomingMovieCollectionViewCell: BaseCollectionViewMovieCell {
    
    static let reuseId: String = "upcomingMovieCollectionViewCell"
    
    weak var cellViewModel: DetailMovieViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            
            let url = URL(string: "https://image.tmdb.org/t/p/w500/\(viewModel.imageName)")
            movieCellImage.sd_setImage(with: url)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
