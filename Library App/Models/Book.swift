//
//  Book.swift
//  Library App
//
//  Created by 山里カズミ on 2021/10/10.
//

import Foundation

class Book: Identifiable, Decodable {
    
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var id:Int
    var content:[String]
}
