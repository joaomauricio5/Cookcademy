//
//  ContentView.swift
//  Cookcademy
//
//  Created by João Mauricio UWE ID 18030724 on 09/03/2022.
//

import SwiftUI

struct RecipesListView: View {
    
    let category: Category
    @EnvironmentObject var recipeData: RecipeData
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    private var filteredRecipes: [Recipe] {
        recipeData.recipes.filter { $0.mainInformation.category == category}
    }
    
    var body: some View {
            List{
                ForEach(filteredRecipes) { recipe in
                    NavigationLink(recipe.mainInformation.name,
                                   destination: RecipeDetailView(recipe: recipe))
                }
                .listRowBackground(listBackgroundColor)
            }
            .navigationTitle("\(category.rawValue) recipes")
        
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipesListView(category: Category.breakfast)
                .environmentObject(RecipeData())
        }
    }
}
