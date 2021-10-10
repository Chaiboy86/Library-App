//
//  BookContentView.swift
//  Library App
//
//  Created by 山里カズミ on 2021/10/10.
//

import SwiftUI

struct BookContentView: View {
    
    var book:Book
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
            TabView(selection: $tabSelectionIndex){
                
                ForEach(book.content.indices){
                    index in
                    VStack(alignment: .center){
                        Text(book.content[index])
                            .tag(index)
                        
                        Spacer()
                        
                        Text("\(index + 1)")
                    }
                    .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

struct BookContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        
        BookContentView(book: model.books[1])
        
        
    }
}
