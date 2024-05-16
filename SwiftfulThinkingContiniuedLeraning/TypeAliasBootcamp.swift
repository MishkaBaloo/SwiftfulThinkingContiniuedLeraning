//
//  TypeAliasBootcamp.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 16.05.2024.
//

import SwiftUI

struct MovieModel { // Model
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel // new name for existing type

struct TypeAliasBootcamp: View {
    
    //@State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    @State var item: TVModel = TVModel(title: "TV Title", director: "Emmily", count: 10)
    var body: some View {
        VStack{
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    TypeAliasBootcamp()
}
