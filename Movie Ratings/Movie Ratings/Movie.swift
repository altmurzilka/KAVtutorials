//
//  Movie.swift
//  Movie Ratings
//
//  Created by алтынпончик on 5/23/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct Movie: Identifiable, Decodable {
    var id : Int
    var original_title: String
    var vote_average: CGFloat
    var poster_path: String
    var overview: String
}
