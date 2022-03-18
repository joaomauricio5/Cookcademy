//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Joao Mauricio on 13/03/2022.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    
    @StateObject var recipeData = RecipeData()
    
    var categories: [Category] {
        recipeData.categories
    }
    
    var body: some View {
        let layout = [GridItem(), GridItem()]
        NavigationView{
            ScrollView{
                LazyVGrid(columns: layout) {
                    ForEach(categories, id: \.self) { category in
                        NavigationLink(destination: RecipesListView(category: category).environmentObject(recipeData),
                                       label: {CategoryView(category: category)})
                    }
                }
            }.navigationTitle("Categories")
        }
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
        RecipeCategoryGridView()
    }
}
