//
//  MovieList.swift
//  MovieApp
//
//  Created by Elena Džojić on 10/04/2020.
//  Copyright © 2020 Stjepan Dzojic. All rights reserved.
//

import Foundation

public struct MovieList: Codable{
    let id: Int
    let overview: String
    let releaseDate: String
    let genreIds: [Int] 
    let originalTitle: String
    let originalLanguage: String
    let posterPath: String
    let title: String
    let adult: Bool
    let backdropPath: String
    let video: Bool
    let voteAverage: Float
}





