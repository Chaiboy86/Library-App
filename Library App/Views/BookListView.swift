//
//  BookListView.swift
//  Library App
//
//  Created by 山里カズミ on 2021/10/10.
//

import SwiftUI

struct BookListView: View {
    
    @EnvironmentObject var model: BookModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 30){
                    ForEach(model.books){
                        b in
                        // MARK: Book card
                        NavigationLink(destination: BookDetailView(book: b), label: {
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(color: .gray, radius: 5, x: -5, y: 5)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text(b.title)
                                            .font(.title)
                                            .bold()
                                        if b.isFavourite{
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 28, height: 28)
                                                .foregroundColor(.yellow)
                                        }
                                    }
                                    Text(b.author)
                                        .italic()
                                    Image("cover\(b.id)")
                                        .resizable()
                                        .scaledToFit()
                                }
                                .padding()
                            }
                            .accentColor(.black)
                            .padding([.leading, .trailing], 20)
                        }
                        )
                    }
                }
                .padding(.top)
            }
            .padding(.leading)
            .navigationTitle("My Library")
        }
    }
}


struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .environmentObject(BookModel())
    }
}
