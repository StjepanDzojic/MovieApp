//
//  Response.swift
//  MovieApp
//
//  Created by Elena Džojić on 10/04/2020.
//  Copyright © 2020 Stjepan Dzojic. All rights reserved.
//

import Foundation

public struct Response<T: Codable>: Codable {
    let results: T?
    //let genres: T?
}
