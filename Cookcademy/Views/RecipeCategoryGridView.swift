//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 13/03/2022.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    
    let recipeData = RecipeData()
    
    var body: some View {
        NavigationView{
            ScrollView{
                let layout = [GridItem(), GridItem()]
                LazyVGrid(columns: layout) {
                    ForEach(recipeData.categories.allCases, id: \.self) { category in
                        NavigationLink(destination: {Text(category.rawValue)},
                                       label: {CategoryView(category: category)})
                    }
                }
            }
        }.navigationTitle("Categories")
    }
}

struct CategoryView: View {
    var category: Category
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.3)
            Text(category.rawValue)
                .font(.title)
                .bold()
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipeCategoryGridView()
        }
    }
}
