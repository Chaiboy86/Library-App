//
//  BookModel.swift
//  Library App
//
//  Created by 山里カズミ on 2021/10/10.
//

import Foundation

class BookModel : ObservableObject{
    
    @Published var books = [Book]()
    
    init(){
        
        self.books = DataService.getLocalData()
        
    }
    
    func updateFavourite(forId: Int){
        if let index = books.firstIndex(where: {$0.id == forId}){
            books[index].isFavourite.toggle()
        }
    }

    func updateRating(forId: Int, rating: Int){
        if let index = books.firstIndex(where: {$0.id == forId}){
            books[index].rating = rating
        }
    }

    
    
}
