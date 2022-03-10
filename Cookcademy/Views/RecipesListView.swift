//
//  ContentView.swift
//  Cookcademy
//
//  Created by João Mauricio UWE ID 18030724 on 09/03/2022.
//

import SwiftUI

struct RecipesListView: View {
    
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        NavigationView{
            List{
                
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.mainInformation.name,
                                   destination: RecipeDetailView(recipe: recipe))
                }
            }
            .navigationTitle(navigationTitle)
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipesListView()
        }
    }
}


extension RecipesListView {
    
    var navigationTitle: String {
        "All Recipes"
    }
    
    var recipes: [Recipe] {
        recipeData.recipes
    }
    
}
