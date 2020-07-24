//
//  Data.swift
//  RestApp Zomato API
//
//  Created by Алтын on 7/25/20.
//

import Foundation

struct datatype: Identifiable {
    var id : String
    var name : String
    var image: String
    var rating: String
    var webUrl: String
}

struct Type: Decodable {
    var nearby_restaurants : [Type1]
}

struct Type1: Decodable {
    var restaurant : Type2
}

struct Type2 : Decodable {
    var id: String
    var name: String
    var url: String
    var thumb: String
    var user_rating : Type3
}

struct Type3 : Decodable {
    var aggregate_rating : String
}
