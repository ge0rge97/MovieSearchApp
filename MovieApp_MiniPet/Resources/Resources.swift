//
//  Resources.swift
//  MovieApp_MiniPet
//
//  Created by Georgiy Groshev on 16.12.2022.
//

import UIKit

typealias R = Resources

enum Resources {
    //MARK: - Colors
    enum Colors {
        static let mainBackground: UIColor = UIColor(hexString: "151111")
        static let separator: UIColor = UIColor(hexString: "3C3C3C")
        static let baseButtonColor: UIColor = UIColor(hexString: "F9CF32")
        static let mainWhite: UIColor = UIColor(hexString: "FCFCFC")
        static let searchBarColor: UIColor = UIColor(hexString: "3C3C3C")
        static let createdYearColor: UIColor = UIColor(hexString: "8C8C8C")
    }
}
//MARK: - Fonts
extension Resources {
    enum Fonts {
        static func regularFont(withSize size: CGFloat) -> UIFont? {
            return UIFont(name: "Georgia", size: size)
        } //MARK: - Regular (Georgia)
        static func boldFont(withSize size: CGFloat) -> UIFont? {
            return UIFont(name: "Georgia-Bold", size: size)
        } //MARK: - Regular (Georgia)
    }
}
//MARK: - Images
extension Resources {
    enum Images {
        static let startScreenBackgroundImage: UIImage? = UIImage(named: "mainImageBackground")
        static let noInternetConnectionViewImage: UIImage? = UIImage(named: "noInternetConnectionImage")
        static let saveButtonImage: UIImage? = UIImage(systemName: "heart.fill")
        static let removeButtonImage: UIImage? = UIImage(systemName: "trash.fill")
        static let sharedViewImage: UIImage? = UIImage(systemName: "arrowshape.turn.up.forward")
        static let addToListViewImage: UIImage? = UIImage(systemName: "bookmark")
        static let averageRatingViewImage: UIImage? = UIImage(systemName: "star")
    }
}
//MARK: - Strings
extension Resources {
    enum Strings {
        enum Auth {
            static let loginTitle: String = "LOGIN"
            static let signUpTitle: String = "SIGN UP"
            static let loginTransition: String = "Haven't account?"
            static let signUpTransition: String = "Already have an account?"
            static let emailTextFieldText: String = "Enter Email"
            static let passwordTextFieldText: String = "Enter Password"
        }
        enum Home {
            static let navigationTitle: String = "Home"
            static let logOutImageName: String = "logout"
            static let noInternetConnectionViewTitle: String = "There's no Internet connection..."
        }
        enum List {
            static let navigationTitle: String = "Your List"
        }
        enum Search {
            static let searchBarPlaceholder: String = "Search your favourite movie"
        }
        enum Details {
            static let addToListViewTitle: String = "List"
            static let sharedViewTitle: String = "Shared"
            static let movieDetailsButtonTitle: String = "Movie Details"
        }
    }
}
//MARK: - Cell Ids
extension Resources {
    enum CellIds {
        static let upcomingMovieCollectionViewCell: String = "upcomingMovieCollectionViewCell"
        static let trendingMovieCollectionViewCell: String = "trendingMovieCollectionViewCell"
        static let homeCollectionViewHeaderCell: String = "homeCollectionViewHeaderCell"
        static let savedCollectionViewCell: String = "savedCollectionViewCell"
        static let searchCollectionViewCell: String = "searchCollectionViewCell"
    }
}
//MARK: - URLs
extension Resources {
    enum StringURLs {
        static let movieDatabaseImage: String = "https://image.tmdb.org/t/p/w500/"
        static let movieDatabaseInfo: String = "https://www.themoviedb.org/movie/"
    }
}
