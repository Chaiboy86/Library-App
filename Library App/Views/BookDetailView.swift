//
//  BookDetailView.swift
//  Library App
//
//  Created by 山里カズミ on 2021/10/10.
//

import SwiftUI

struct BookDetailView: View {
    
    @EnvironmentObject var model: BookModel
    @State var selectedRating = 1
    var book:Book
    
    var body: some View {
        
        VStack(spacing: 20){
            Text(book.title)
            NavigationLink(destination: BookContentView(book: book)){
                VStack{
                    Text("Read Now!")
                        .font(.title)
                        .accentColor(.black)
                    Image("cover\(book.id)")
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding()
            Text("Mark for later!")
                .font(.headline)
            
            // TODO: Button behavior
            Button(action: { model.updateFavourite(forId: book.id)
                self.book.isFavourite.toggle()
            })
                   {
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
                    .accentColor(.yellow)
            Spacer()
            
            Text("Rate\(book.title)")
            Picker("Rate this book!",selection: $selectedRating){
                ForEach(1..<6) {
                    index in
                    Text("\(index)")
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding([.leading, .trailing, .bottom], 60)
            .onChange(of: selectedRating, perform: {
                value in
                model.updateRating(forId: book.id, rating: selectedRating)
            })
        }
        .onAppear { selectedRating = book.rating }
        .navigationBarTitle("\(book.title)")
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = BookModel()
        
        BookDetailView(book: model.books[1])
            .environmentObject(model)
    }
}
