//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Elena Džojić on 10/04/2020.
//  Copyright © 2020 Stjepan Dzojic. All rights reserved.
//

import UIKit

struct MovieListNeeded {
    let id: Int
    let title: String
    let description: String
    let imageURL: String
    let year: String
    //let genre: Genre
    //let director:

    
    init(id: Int, title: String, description: String, imageURL: String, year: String){
        self.id = id
        self.title = title
        self.description = description
        self.imageURL = imageURL
        self.year = year
        //self.genre = genre
        //self.director = director
        

    }
}
