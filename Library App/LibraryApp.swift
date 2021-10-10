//
//  LibraryApp.swift
//  Library App
//
//  Created by 山里カズミ on 2021/10/10.
//

import SwiftUI

@main
struct LibraryApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environmentObject(BookModel())
        }
    }
}
